`include "c4bit.v"
module c8bit(a,b,a_lt_b,a_eq_b,a_gt_b);

input [7:0]a;
input [7:0]b;
output reg a_lt_b,a_eq_b,a_gt_b;

output wire a_lt_b1,a_eq_b1,a_gt_b1;
output wire a_lt_b2,a_eq_b2,a_gt_b2;

c4bit c1(a[7:4],b[7:4],a_lt_b1,a_eq_b1,a_gt_b1);
c4bit c2(a[3:0],b[3:0],a_lt_b2,a_eq_b2,a_gt_b2);
always @(*)
begin
a_eq_b <= a_eq_b1 &&  a_eq_b2;

a_lt_b <= a_lt_b1 || !(a[7] ^ b[7]) && !(a[6] ^ b[6]) && !(a[5] ^ b[5]) && !(a[4] ^ b[4]) && a_lt_b2; 

a_gt_b <= a_gt_b1 || (a[7] ~^ b[7]) && (a[6] ~^ b[6]) && (a[5] ~^ b[5]) && (a[4] ~^ b[4]) && a_gt_b2; 

end
endmodule
