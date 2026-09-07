// Empty blackbox stub for hierarchical integration LVS.
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
endmodule
