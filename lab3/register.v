module register(clk,rst,in,ld_en,out);
//sync ckt
input clk,rst,ld_en;
input [31:0] in;
output reg [31:0] out;
//reg [31:0] out;
always @(posedge clk)
	begin
		if(rst == 1)
		out <= 0;
		else if(ld_en == 1)
		out <= in;
 	end
endmodule
