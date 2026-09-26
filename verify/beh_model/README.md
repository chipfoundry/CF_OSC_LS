# CF_OSC_LS behavioral model

Ideal functional model for digital simulation. It is **not** SPICE-accurate
and it is **not** silicon-verified. Do not add this file to OpenLane
`VERILOG_FILES`.

## Files

| File | Replaces |
|---|---|
| `CF_OSC_LS_core.v` | `hdl/gl/CF_OSC_LS_core.v` |

Keep the customer wrap in `hdl/gl/CF_OSC_LS.v`. Do **not** compile the empty
`hdl/gl/CF_OSC_LS_core.v` stub in the same sim (duplicate module name).

```bash
./verify/beh_model/run_tb.sh
```

## Behavior

Ideal low-speed oscillator. With `pdb` high, `En1k` runs `clkout1` at 1 kHz, `En100k` runs `clkout2` at 100 kHz, and `DivEn` runs `clkout_div3` at 100 kHz / 3.
