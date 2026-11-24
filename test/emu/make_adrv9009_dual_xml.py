#!/usr/bin/env python3
"""A context with two ADRV9009 on one receive and one transmit device, put
together from adrv9009.xml.

    make_adrv9009_dual_xml.py <adrv9009.xml> <first phy> <second phy> <output file>

pyadi-iio (test/emu/devices) has no context file of an ADRV9009-ZU11EG or of
an FMComms8. Both have two ADRV9009 that share the devices
axi-adrv9009-rx-hpc (four I/Q pairs) and axi-adrv9009-tx-hpc (four I/Q
pairs); the names of the two transceiver devices are what differs:
adrv9009-phy and adrv9009-phy-b on the ADRV9009-ZU11EG, adrv9009-phy-c and
adrv9009-phy-d on the FMComms8. The output is adrv9009.xml with these
changes:

  - the device adrv9009-phy has the name <first phy>, and a copy of it with
    the id iio:device7 and the name <second phy> follows it
  - axi-adrv9009-rx-hpc has the channels voltage2_i, voltage2_q, voltage3_i
    and voltage3_q, copies of voltage0_i to voltage1_q with the scan
    indexes 4 to 7
  - axi-adrv9009-tx-hpc has the channels voltage4 to voltage7, copies of
    voltage0 to voltage3 with the scan indexes 4 to 7, and the DDS tones
    altvoltage8 to altvoltage15 (TX3_*, TX4_*), copies of altvoltage0 to
    altvoltage7 (TX1_*, TX2_*)

It is not a capture of a board: the context attributes are those of the
ADRV9009 on a ZC706, and the observation receiver is left as it is.

test/emu/adrv9009zu11eg.xml and test/emu/fmcomms8.xml are the output of
    make_adrv9009_dual_xml.py adrv9009.xml adrv9009-phy adrv9009-phy-b adrv9009zu11eg.xml
    make_adrv9009_dual_xml.py adrv9009.xml adrv9009-phy-c adrv9009-phy-d fmcomms8.xml
"""
import re
import sys


def device(text, name):
    """(start, end) of the device element with the given name"""
    m = re.search(r'<device id="[^"]*" name="%s" >' % re.escape(name), text)
    if not m:
        raise SystemExit("no device %s" % name)
    end = text.index("</device>", m.end()) + len("</device>")
    return m.start(), end


def channel(dev, cid):
    """(start, end) of the channel element with the given id"""
    found = list(re.finditer(r'<channel id="%s"[ >]' % re.escape(cid), dev))
    if len(found) != 1:
        raise SystemExit("channel %s: %d matches" % (cid, len(found)))
    start = found[0].start()
    end = dev.index("</channel>", start) + len("</channel>")
    return start, end


def sub(pattern, repl, text, what, count):
    """re.sub that must replace exactly count times"""
    out, n = re.subn(pattern, repl, text)
    if n != count:
        raise SystemExit("%s: %d replacements, expected %d" % (what, n, count))
    return out


def copy_channel(dev, old, new, index_shift, old_file, new_file):
    """The channel old of dev as channel new: the id, the scan index (when
    index_shift is not 0) and the start of the file names of its attributes"""
    s, e = channel(dev, old)
    c = dev[s:e]
    if '<channel id="%s"' % new in dev:
        raise SystemExit("there is a channel %s already" % new)
    c = c.replace('<channel id="%s"' % old, '<channel id="%s"' % new, 1)
    if index_shift:
        m = re.search(r'<scan-element index="(\d+)" ', c)
        if not m:
            raise SystemExit("channel %s has no scan element" % old)
        c = c[:m.start()] + '<scan-element index="%d" ' % (int(m.group(1)) + index_shift) + c[m.end():]
    # the file names of the channel itself; those that all channels of a
    # direction share (in_voltage_sampling_frequency) stay
    if 'filename="%s' % old_file not in c:
        raise SystemExit("channel %s: no file name starts with %s" % (old, old_file))
    c = c.replace('filename="%s' % old_file, 'filename="%s' % new_file)
    if old in c:
        raise SystemExit("channel %s: the id is left in the copy" % old)
    return c


def main(in_file, first, second, out_file):
    if first == second:
        raise SystemExit("the two names are the same")
    with open(in_file, encoding="utf-8", newline="") as f:
        text = f.read()
    if 'id="iio:device7"' in text:
        raise SystemExit("%s has an iio:device7" % in_file)

    # the receive device: two more I/Q pairs
    s, e = device(text, "axi-adrv9009-rx-hpc")
    dev = text[s:e]
    new = ""
    for n in (0, 1):
        for part in ("i", "q"):
            old_id = "voltage%d_%s" % (n, part)
            new_id = "voltage%d_%s" % (n + 2, part)
            new += copy_channel(dev, old_id, new_id, 4, "in_%s_" % old_id, "in_%s_" % new_id)
    k = channel(dev, "voltage1_q")[1]
    text = text[:s] + dev[:k] + new + dev[k:] + text[e:]

    # the transmit device: four more channels and their DDS tones
    s, e = device(text, "axi-adrv9009-tx-hpc")
    dev = text[s:e]
    new = ""
    for n in range(4):
        new += copy_channel(dev, "voltage%d" % n, "voltage%d" % (n + 4), 4,
                            "out_voltage%d_" % n, "out_voltage%d_" % (n + 4))
    k = channel(dev, "voltage3")[1]
    dev = dev[:k] + new + dev[k:]
    new = ""
    for n in range(8):
        s2, e2 = channel(dev, "altvoltage%d" % n)
        m = re.match(r'<channel id="altvoltage%d" name="TX([12])_([IQ]_F[12])" ' % n, dev[s2:e2])
        if not m:
            raise SystemExit("altvoltage%d is not a tone of TX1 or TX2" % n)
        old_name = "TX%s_%s" % (m.group(1), m.group(2))
        new_name = "TX%d_%s" % (int(m.group(1)) + 2, m.group(2))
        c = copy_channel(dev, "altvoltage%d" % n, "altvoltage%d" % (n + 8), 0,
                         "out_altvoltage%d_%s_" % (n, old_name),
                         "out_altvoltage%d_%s_" % (n + 8, new_name))
        c = c.replace(' name="%s" type="output" >' % old_name, ' name="%s" type="output" >' % new_name, 1)
        # the attribute label holds the name
        c = sub(r' value="%s" />' % old_name, ' value="%s" />' % new_name, c, "label of " + old_name, 1)
        if old_name in c:
            raise SystemExit("altvoltage%d: %s is left in the copy" % (n, old_name))
        new += c
    k = max(channel(dev, "altvoltage%d" % n)[1] for n in range(8))
    text = text[:s] + dev[:k] + new + dev[k:] + text[e:]

    # the transceiver: two of them
    s, e = device(text, "adrv9009-phy")
    dev = text[s:e]
    head = '<device id="iio:device3" name="adrv9009-phy" >'
    if not dev.startswith(head):
        raise SystemExit("adrv9009-phy is not iio:device3")
    body = dev[len(head):]
    text = (text[:s]
            + '<device id="iio:device3" name="%s" >' % first + body
            + '<device id="iio:device7" name="%s" >' % second + body
            + text[e:])

    with open(out_file, "w", encoding="utf-8", newline="") as f:
        f.write(text)


if __name__ == "__main__":
    if len(sys.argv) != 5:
        raise SystemExit(__doc__)
    main(*sys.argv[1:])
