//module interfacing

`include "gcdpath.v"
`include "gcdcontrol.v"
module gcd_mach(clk,rst,go,a,b,out,done);
input clk,rst,go;
input [31:0] a,b;
output [31:0] out;
//reg [31:0] out;
output done;

wire a_gt_b,a_eq_b,a_lt_b,a_ld,a_sel,b_ld,b_sel,output_en;

gcdcontrol c1(.clk(clk),.rst(rst),.go(go),.a_gt_b(a_gt_b),.a_eq_b(a_eq_b),.a_lt_b(a_lt_b),.a_ld(a_ld),.b_ld(b_ld),.a_sel(a_sel),.b_sel(b_sel),.output_en(output_en),.done(done));

gcdpath d1(clk,rst,a,b,a_sel,b_sel,a_ld,b_ld,a_gt_b,a_eq_b,a_lt_b,output_en,out);

endmodule
