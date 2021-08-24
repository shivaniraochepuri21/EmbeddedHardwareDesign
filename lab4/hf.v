module hf (x, y, sum, carry);
input x;
input y;
inout wire sum,carry;
assign sum = (x & ~y) || (~x & y);
assign carry = x & y;
endmodule
