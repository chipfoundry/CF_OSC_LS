#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_osc_ls_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_OSC_LS.v" \
  "$ROOT/verify/beh_model/CF_OSC_LS_core.v" \
  "$ROOT/verify/beh_model/tb_CF_OSC_LS.v"
vvp "$OUT"
