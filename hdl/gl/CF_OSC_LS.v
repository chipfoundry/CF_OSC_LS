// Structural PG wrapper. Analog leaf is CF_OSC_LS_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_OSC_LS (
    trim100k,
    trim1k,
    coarsetrim,
    vpwr,
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
    input vpwr;
    input vgnd;
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
    CF_OSC_LS_core u_core (
        .trim100k(trim100k),
        .trim1k(trim1k),
        .coarsetrim(coarsetrim),
        .vpwr(vpwr),
        .vpb(vpwr),
        .vnb(vgnd),
        .vgnd(vgnd),
        .clkout_div3(clkout_div3),
        .clkout2(clkout2),
        .clkout1(clkout1),
        .turbo(turbo),
        .stup(stup),
        .satbiasb(satbiasb),
        .pdb(pdb),
        .pd_mode(pd_mode),
        .hs(hs),
        .En100k(En100k),
        .En1k(En1k),
        .DivEn(DivEn)
    );
endmodule
