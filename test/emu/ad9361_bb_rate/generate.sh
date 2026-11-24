#!/bin/sh
# Expected files of the sampling rate tests in test/IIOv1EmuTests.m, from
# the C source of libad9361-iio.
#
#   generate.sh <libiio v1 prefix> <output folder> [<libad9361-iio source folder>]
#
# Builds bb_rate_harness.c with the unchanged ad9361_baseband_auto_rate.c of
# libad9361-iio (fetched at the commit below when no source folder is given)
# against libiio v1 in <libiio v1 prefix> (libiio-conv/deps/install), runs it
# on the context files of test/emu and writes to <output folder>:
#
#   <case>.log        the attribute accesses of ad9361_set_bb_rate, for the
#                     rates of the case one after the other on one context
#   fir_<rate>.txt    the bytes written to filter_fir_config for the rate
#
# A case is <board>_<rate>[_<rate>...]. The board "plutowide" is pluto.xml
# with the range of sampling_frequency that the driver reports while a
# filter that decimates by 4 is enabled, [520833 1 61440000] in place of
# [2083333 1 61440000]: the emulation refuses a value outside the range in
# the file, and does not change the range when the filter is enabled.
#
# The folder "expected" beside this script is the output of
#   generate.sh <libiio-conv>/deps/install expected
set -eu
LIBAD9361_COMMIT=becf6ca8f6536cd1a6c090738c034064e86d412a
LIBAD9361_URL=https://raw.githubusercontent.com/analogdevicesinc/libad9361-iio

[ $# -ge 2 ] || { echo "usage: $0 <libiio v1 prefix> <output folder> [<libad9361-iio source folder>]" >&2; exit 2; }
here=$(cd "$(dirname "$0")" && pwd)
prefix=$(cd "$1" && pwd)
mkdir -p "$2"
out=$(cd "$2" && pwd)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

if [ $# -ge 3 ]; then
	cp "$3/ad9361_baseband_auto_rate.c" "$3/ad9361.h" "$work/"
else
	for f in ad9361_baseband_auto_rate.c ad9361.h; do
		curl -fsSL --retry 3 -o "$work/$f" "$LIBAD9361_URL/$LIBAD9361_COMMIT/$f"
	done
fi

${CC:-cc} -Wall -O1 -I"$here" -I"$work" -I"$prefix/include" \
	"$here/bb_rate_harness.c" "$work/ad9361_baseband_auto_rate.c" \
	-L"$prefix/lib" -liio -Wl,-rpath,"$prefix/lib" -o "$work/bb_rate_harness"

cp "$here/../pluto.xml" "$work/pluto.xml"
cp "$here/../fmcomms2-3.xml" "$work/fmcomms2-3.xml"
sed 's/\[2083333 1 61440000\]/[520833 1 61440000]/g' "$here/../pluto.xml" > "$work/plutowide.xml"
if cmp -s "$work/pluto.xml" "$work/plutowide.xml"; then
	echo "pluto.xml has no range [2083333 1 61440000]" >&2
	exit 1
fi

# <case>.log: board, then the rates
run_case() {
	board=$1
	shift
	name=$board
	for r in "$@"; do name="${name}_$r"; done
	xml=$board
	[ "$board" = fmcomms2 ] && xml=fmcomms2-3
	cp "$work/$xml.xml" "$work/ctx.xml"
	"$work/bb_rate_harness" "$work/ctx.xml" - "$@" > "$out/$name.log"
}
run_case pluto 4000000 30000000
run_case pluto 45000000 61440000
run_case pluto 2083333 3000000
run_case pluto 1000000
run_case fmcomms2 1500000 25000000
run_case plutowide 520833 1000000

# fir_<rate>.txt: one rate on a new context
for r in 520833 2083333 4000000 20000000 20000001 40000000 40000001 53333333 53333334 61440000; do
	cp "$work/plutowide.xml" "$work/ctx.xml"
	"$work/bb_rate_harness" "$work/ctx.xml" "$out/fir_$r.txt" "$r" > /dev/null
done
