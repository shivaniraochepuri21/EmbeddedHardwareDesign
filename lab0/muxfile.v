module muxfile (sel, in0, in1, out);
input in0;
input in1;
input sel;
output out;
wire out;
assign out = sel?in1:in0;
endmodule
