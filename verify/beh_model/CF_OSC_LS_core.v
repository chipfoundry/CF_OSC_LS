`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_OSC_LS_core.
// Drop this file in place of hdl/gl/CF_OSC_LS_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * pdb high runs the oscillator (active-low power-down)
//   * En1k gates clkout1 at 1 kHz
//   * En100k gates clkout2 at 100 kHz
//   * DivEn gates clkout_div3 at 100 kHz / 3
// Trims, turbo, startup, and high-speed select are not modeled.

module CF_OSC_LS_core (
    trim100k,
    trim1k,
    coarsetrim,
    vpwr,
    vpb,
    vnb,
    vgnd,
    clkout_div3,
    clkout2,
    clkout1,
    turbo,
    stup,
    satbiasb,
    pdb,
    pd_mode,
    hs,
    En100k,
    En1k,
    DivEn
);
    input [3:0] trim100k;
    input [3:0] trim1k;
    input [2:0] coarsetrim;
    inout vpwr;
    inout vpb;
    inout vnb;
    inout vgnd;
    output clkout_div3;
    output clkout2;
    output clkout1;
    input turbo;
    input stup;
    input satbiasb;
    input pdb;
    input pd_mode;
    input hs;
    input En100k;
    input En1k;
    input DivEn;

    localparam real HALF_1K_NS = 5.0e5;
    localparam real HALF_100K_NS = 5.0e3;
    localparam real HALF_DIV3_NS = 1.5e4;

    reg clkout1;
    reg clkout2;
    reg clkout_div3;

    wire run = (pdb === 1'b1);
    wire run_1k = run && (En1k === 1'b1);
    wire run_100k = run && (En100k === 1'b1);
    wire run_div = run && (DivEn === 1'b1);

    initial begin
        clkout1 = 1'b0;
        clkout2 = 1'b0;
        clkout_div3 = 1'b0;
    end

    always begin
        if (!run_1k) begin
            clkout1 = 1'b0;
            @(posedge run_1k);
        end else begin
            #(HALF_1K_NS) clkout1 = ~clkout1;
        end
    end

    always begin
        if (!run_100k) begin
            clkout2 = 1'b0;
            @(posedge run_100k);
        end else begin
            #(HALF_100K_NS) clkout2 = ~clkout2;
        end
    end

    always begin
        if (!run_div) begin
            clkout_div3 = 1'b0;
            @(posedge run_div);
        end else begin
            #(HALF_DIV3_NS) clkout_div3 = ~clkout_div3;
        end
    end
endmodule
