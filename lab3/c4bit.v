`include "c2bit.v"
module c4bit(a,b,a_lt_b,a_eq_b,a_gt_b);

input [3:0]a;
input [3:0]b;
output reg a_lt_b,a_eq_b,a_gt_b;

output wire a_lt_b1,a_eq_b1,a_gt_b1;
output wire a_lt_b2,a_eq_b2,a_gt_b2;

c2bit c1(a[3:2],b[3:2],a_lt_b1,a_eq_b1,a_gt_b1);
c2bit c2(a[1:0],b[1:0],a_lt_b2,a_eq_b2,a_gt_b2);
always @(*)
begin

a_eq_b <= a_eq_b1 &  a_eq_b2;

a_lt_b <= a_lt_b1 | (((a[2] & b[2]) || (!a[2] & !b[2])) & ((a[3] & b[3]) || (!a[3] & !b[3])) & (a_lt_b2));

a_gt_b <= a_gt_b1 || (((a[2] && b[2]) || (!a[2] && !b[2])) && ((a[3] && b[3]) || (!a[3] && !b[3])) && (a_gt_b2));

end
endmodule
