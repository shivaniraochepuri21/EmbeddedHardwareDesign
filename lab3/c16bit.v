`include "c8bit.v"
module c16bit(a,b,a_lt_b,a_eq_b,a_gt_b);

input [15:0]a;
input [15:0]b;
output reg a_lt_b,a_eq_b,a_gt_b;

output wire a_lt_b1,a_eq_b1,a_gt_b1;
output wire a_lt_b2,a_eq_b2,a_gt_b2;

c8bit c1(a[15:8],b[15:8],a_lt_b1,a_eq_b1,a_gt_b1);
c8bit c2(a[7:0],b[7:0],a_lt_b2,a_eq_b2,a_gt_b2);
always @(*)
begin
a_eq_b <= a_eq_b1 &&  a_eq_b2;


a_lt_b <= a_lt_b1 || !(a[15]^b[15]) && !(a[14] ^ b[14]) && !(a[13] ^ b[13]) && !(a[12] ^ b[12]) && !(a[11] ^ b[11]) && !(a[10] ^ b[10]) && !(a[9] ^ b[9]) && !(a[8] ^ b[8]) && a_lt_b2; 

a_gt_b <= a_gt_b1 || !(a[15] ^ b[15]) && !(a[14] ^ b[14]) && !(a[13] ^ b[13]) && !(a[12] ^ b[12]) && !(a[11] ^ b[11]) && !(a[10] ^ b[10]) && !(a[9] ^ b[9]) && !(a[8] ^ b[8]) && a_gt_b2; 

end
endmodule
