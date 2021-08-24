module mux(out,sel,in0,in1);
output [31:0]out;
reg [31:0] out;
input [31:0] in1,in0;
input sel;

always @(sel or in0 or in1)
//if any of the sel or in0or in1 changes even by a single bit,as we are giving the whole vector inside the sensitivity list,the always block reacts and output changes

begin
out <= sel?in1:in0;
end

endmodule
