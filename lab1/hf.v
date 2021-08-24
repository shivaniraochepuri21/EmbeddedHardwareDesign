module hf (x, y, sum, carry);
input x;
input y;
output wire sum;
output wire carry;
//wire sum,carry;
assign sum = (x & ~y) || (~x & y);
assign carry = x & y;
endmodule
