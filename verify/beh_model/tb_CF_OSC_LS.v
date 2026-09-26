`timescale 1ns / 1ps

module tb_CF_OSC_LS;
    integer errors;
    integer n1, n2, ndiv;
    reg [3:0] trim100k, trim1k;
    reg [2:0] coarsetrim;
    reg vpwr, vgnd, turbo, stup, satbiasb, pdb, pd_mode, hs, En100k, En1k, DivEn;
    wire clkout_div3, clkout2, clkout1;

    CF_OSC_LS u (
        .trim100k(trim100k), .trim1k(trim1k), .coarsetrim(coarsetrim),
        .vpwr(vpwr), .vgnd(vgnd), .clkout_div3(clkout_div3), .clkout2(clkout2),
        .clkout1(clkout1), .turbo(turbo), .stup(stup), .satbiasb(satbiasb),
        .pdb(pdb), .pd_mode(pd_mode), .hs(hs), .En100k(En100k), .En1k(En1k), .DivEn(DivEn)
    );

    initial begin
        errors = 0;
        n1 = 0; n2 = 0; ndiv = 0;
        trim100k = 0; trim1k = 0; coarsetrim = 0;
        vpwr = 1; vgnd = 0; turbo = 0; stup = 0; satbiasb = 1;
        pdb = 1; pd_mode = 0; hs = 0; En100k = 1; En1k = 0; DivEn = 1;
    end

    always @(posedge clkout1) n1 = n1 + 1;
    always @(posedge clkout2) n2 = n2 + 1;
    always @(posedge clkout_div3) ndiv = ndiv + 1;

    initial begin
        #100_000;
        if (n2 < 8 || n2 > 12) begin
            $display("FAIL clkout2 edges %0d", n2);
            errors = errors + 1;
        end else $display("PASS clkout2 %0d", n2);
        if (ndiv < 2 || ndiv > 4) begin
            $display("FAIL div edges %0d", ndiv);
            errors = errors + 1;
        end else $display("PASS div %0d", ndiv);
        if (n1 != 0 || clkout1 !== 1'b0) begin
            $display("FAIL clkout1 ran");
            errors = errors + 1;
        end else $display("PASS clkout1 held");
        pdb = 0;
        #20_000;
        if (clkout2 !== 1'b0 || clkout_div3 !== 1'b0) begin
            $display("FAIL power-down");
            errors = errors + 1;
        end else $display("PASS power-down");
        if (errors == 0) $display("CF_OSC_LS behavioral self-check passed");
        else $display("CF_OSC_LS behavioral self-check FAILED %0d", errors);
        $finish(errors != 0);
    end
endmodule
