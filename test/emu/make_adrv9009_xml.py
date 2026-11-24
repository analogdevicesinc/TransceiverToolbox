#!/usr/bin/env python3
"""adrv9009.xml: a context with the receive, the observation and the transmit
path of an ADRV9009, put together from adrv9008-1.xml and adrv9008-2.xml.

    make_adrv9009_xml.py <adrv9008-1.xml> <adrv9008-2.xml> <output file>

pyadi-iio (test/emu/devices) has no context file of an ADRV9009: it has the
ADRV9008-1 (receiver) and the ADRV9008-2 (transmitter and observation
receiver), which are the two halves of that part and use the same driver
(device adrv9009-phy). The output is adrv9008-2.xml with three additions
from adrv9008-1.xml, each copied as it is:

  - in the device adrv9009-phy, the input channels voltage0 and voltage1
    (the two receivers)
  - in the device adrv9009-phy, the device attributes
    calibrate_rx_phase_correction_en and calibrate_rx_qec_en
  - the device axi-adrv9009-rx-hpc, with the id iio:device6 in place of
    iio:device4, which the observation receiver has in adrv9008-2.xml

It is not a capture of a board. The local oscillator altvoltage0 keeps the
name it has in adrv9008-2.xml (TX_LO).

test/emu/adrv9009.xml is the output of
    make_adrv9009_xml.py adrv9008-1.xml adrv9008-2.xml adrv9009.xml
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


def one(pattern, text, what):
    found = re.findall(pattern, text)
    if len(found) != 1:
        raise SystemExit("%s: %d matches" % (what, len(found)))
    return found[0]


def main(rx_file, tx_file, out_file):
    with open(rx_file, encoding="utf-8", newline="") as f:
        rx = f.read()
    with open(tx_file, encoding="utf-8", newline="") as f:
        tx = f.read()

    s, e = device(rx, "adrv9009-phy")
    rx_phy = rx[s:e]
    channels = "".join(
        one(r'<channel id="%s" type="input" >.*?</channel>' % c, rx_phy, c)
        for c in ("voltage0", "voltage1"))
    attrs = "".join(
        one(r'<attribute name="%s" value="[^"]*" />' % a, rx_phy, a)
        for a in ("calibrate_rx_phase_correction_en", "calibrate_rx_qec_en"))
    s, e = device(rx, "axi-adrv9009-rx-hpc")
    rx_dev = rx[s:e]
    if not rx_dev.startswith('<device id="iio:device4" '):
        raise SystemExit("axi-adrv9009-rx-hpc is not iio:device4")
    if 'id="iio:device6"' in tx:
        raise SystemExit("adrv9008-2.xml has an iio:device6")
    rx_dev = rx_dev.replace('<device id="iio:device4" ', '<device id="iio:device6" ', 1)

    s, e = device(tx, "adrv9009-phy")
    tx_phy = tx[s:e]
    for c in ("voltage0", "voltage1"):
        if '<channel id="%s" type="input" >' % c in tx_phy:
            raise SystemExit("adrv9008-2.xml has the input channel %s" % c)
    # the channels in front of the first channel of the device, the
    # attributes in front of its first device attribute
    k = tx_phy.index("<channel ")
    tx_phy = tx_phy[:k] + channels + tx_phy[k:]
    m = re.search(r'</channel><attribute name="calibrate" ', tx_phy)
    if not m:
        raise SystemExit("no device attribute calibrate in adrv9008-2.xml")
    k = m.start() + len("</channel>")
    tx_phy = tx_phy[:k] + attrs + tx_phy[k:]
    out = tx[:s] + tx_phy + tx[e:]

    k = out.index('<device id="iio_sysfs_trigger" ')
    out = out[:k] + rx_dev + out[k:]
    with open(out_file, "w", encoding="utf-8", newline="") as f:
        f.write(out)


if __name__ == "__main__":
    if len(sys.argv) != 4:
        raise SystemExit(__doc__)
    main(*sys.argv[1:])
