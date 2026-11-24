#!/bin/sh
# Expected files of the multichip sync tests in test/IIOv1EmuTests.m, from
# the C source of libad9361-iio.
#
#   generate.sh <libiio v1 prefix> <output folder> [<libad9361-iio source folder>]
#
# Builds mcs_harness.c with the unchanged ad9361_multichip_sync.c of
# libad9361-iio (fetched at the commit below when no source folder is given)
# against libiio v1 in <libiio v1 prefix> (libiio-conv/deps/install), runs it
# on fmcomms5.xml of test/emu and writes to <output folder>:
#
#   <board>_f<flags>_r<slave rate>.log
#                     the attribute and register accesses of
#                     ad9361_fmcomms5_multichip_sync(ctx, <flags>)
#
# Before the call the registers 0x6 and 0x7 of ad9361-phy are set to 0x24 and
# 0x51, and with a <slave rate> other than 0 the sampling rate of
# ad9361-phy-B is set to it (the rate of ad9361-phy is 4000000 in the file).
#
# The board "fmcomms5debug" is fmcomms5.xml without the device attribute
# multichip_sync of the two ad9361-phy devices, which leaves the debug
# attribute of that name: the form of older drivers.
#
# The folder "expected" beside this script is the output of
#   generate.sh <libiio-conv>/deps/install expected
set -eu
LIBAD9361_COMMIT=becf6ca8f6536cd1a6c090738c034064e86d412a
LIBAD9361_URL=https://raw.githubusercontent.com/analogdevicesinc/libad9361-iio
REG6=0x24
REG7=0x51

[ $# -ge 2 ] || { echo "usage: $0 <libiio v1 prefix> <output folder> [<libad9361-iio source folder>]" >&2; exit 2; }
here=$(cd "$(dirname "$0")" && pwd)
prefix=$(cd "$1" && pwd)
mkdir -p "$2"
out=$(cd "$2" && pwd)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

if [ $# -ge 3 ]; then
	cp "$3/ad9361_multichip_sync.c" "$3/ad9361.h" "$work/"
else
	for f in ad9361_multichip_sync.c ad9361.h; do
		curl -fsSL --retry 3 -o "$work/$f" "$LIBAD9361_URL/$LIBAD9361_COMMIT/$f"
	done
fi

${CC:-cc} -Wall -O1 -I"$here" -I"$work" -I"$prefix/include" \
	"$here/mcs_harness.c" "$work/ad9361_multichip_sync.c" \
	-L"$prefix/lib" -liio -Wl,-rpath,"$prefix/lib" -o "$work/mcs_harness"

cp "$here/../fmcomms5.xml" "$work/fmcomms5.xml"
sed 's|<attribute name="multichip_sync" value="ERROR" />||g' "$here/../fmcomms5.xml" > "$work/fmcomms5debug.xml"
if cmp -s "$work/fmcomms5.xml" "$work/fmcomms5debug.xml"; then
	echo "fmcomms5.xml has no device attribute multichip_sync" >&2
	exit 1
fi

# board, flags, slave rate
run_case() {
	cp "$work/$1.xml" "$work/ctx.xml"
	"$work/mcs_harness" "$work/ctx.xml" "$2" "$REG6" "$REG7" "$3" \
		> "$out/$1_f$2_r$3.log" 2> /dev/null
}
run_case fmcomms5 3 0
run_case fmcomms5 3 3000000
run_case fmcomms5 2 3000000
run_case fmcomms5 1 3000000
run_case fmcomms5 0 0
run_case fmcomms5debug 3 0
