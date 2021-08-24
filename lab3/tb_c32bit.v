`include "c32bit.v"
module m;

reg [31:0]a1;
reg [31:0]b1;
wire a_lt_bo,a_eq_bo,a_gt_bo;

c32bit c1(a1,b1,a_lt_bo,a_eq_bo,a_gt_bo);


initial begin

a1 = 32'b00110010001100100011001000111110;
b1 = 32'b11110010001100100011001000111110;
#100
$display("%b %b %b",a_lt_bo,a_eq_bo,a_gt_bo);
end

endmodule
