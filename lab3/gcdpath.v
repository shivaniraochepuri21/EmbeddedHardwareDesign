
`include "mux.v"
`include "register.v"
`include "32bit_fs.v"
`include "c32bit.v"
module gcdpath(clk,rst,in1,in2,a_sel,b_sel,a_ld,b_ld,a_gt_b,a_eq_b,a_lt_b,output_en,out);
input clk,rst,a_sel,b_sel,a_ld,b_ld;
output a_gt_b,a_eq_b,a_lt_b;
input output_en;
output [31:0] out;
input [31:0] in1,in2;

wire [31:0] ta_in,tb_in,ta_out,tb_out,t1,t2;
wire [31:0] t1_car,t2_car;
/*
ta_in is the output of the first mux
t1 goes to 0 of mux
in1 goes to 1 of mux
 a,b,out registers are filp flops --->takes clk and rst as inputs. Consider a flipflop---> if a_ld is high, then ta_out = ta_in i.e, a D filpflop

a shud be kept constant if b needs updating i.e, retain the values of one of them

*/
//subtractor
mod s1(ta_out,tb_out,t1,t1_car);
mod s2(tb_out,ta_out,t2,t2_car);
mux m1(ta_in,a_sel,t1,in1);
mux m2(tb_in,b_sel,t2,in2);
register r1(clk,rst,ta_in,a_ld,ta_out);
register r2(clk,rst,tb_in,b_ld,tb_out);
register r_out(clk,rst,ta_out,output_en,out);
register r_out1(clk,rst,tb_out,output_en,out);
c32bit c1(ta_out,tb_out,a_lt_b,a_eq_b,a_gt_b);
endmodule

