#!/bin/bash
# Source Vivado settings for the given version, supporting both install layouts:
#   2025.1 and later: /opt/Xilinx/<version>/Vivado/settings64.sh
#   2024.2 and older: /opt/Xilinx/Vivado/<version>/settings64.sh
# Usage: source source_vivado.sh <version>

_vivado_ver="${1:?usage: source source_vivado.sh <vivado version>}"
_vivado_settings=""
for _cand in "/opt/Xilinx/${_vivado_ver}/Vivado/settings64.sh" \
             "/opt/Xilinx/Vivado/${_vivado_ver}/settings64.sh"; do
    if [ -f "$_cand" ]; then
        _vivado_settings="$_cand"
        break
    fi
done

if [ -z "$_vivado_settings" ]; then
    echo "ERROR: Vivado ${_vivado_ver} settings64.sh not found under /opt/Xilinx" >&2
    return 1 2>/dev/null || exit 1
fi

echo "Sourcing $_vivado_settings"
source "$_vivado_settings"
unset _vivado_ver _vivado_settings _cand
