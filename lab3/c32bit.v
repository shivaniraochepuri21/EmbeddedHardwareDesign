`include "c16bit.v"
module c32bit(a,b,a_lt_b,a_eq_b,a_gt_b);

input [31:0]a;
input [31:0]b;
output reg a_lt_b,a_eq_b,a_gt_b;

output wire a_lt_b1,a_eq_b1,a_gt_b1;
output wire a_lt_b2,a_eq_b2,a_gt_b2;

c16bit c1(a[31:16],b[31:16],a_lt_b1,a_eq_b1,a_gt_b1);
c16bit c2(a[15:0],b[15:0],a_lt_b2,a_eq_b2,a_gt_b2);
always @(*)
begin
a_eq_b <= a_eq_b1 &&  a_eq_b2;

a_lt_b <= a_lt_b1 || (!(a[31] ^ b[31]) && !(a[30] ^ b[30]) && !(a[29] ^ b[29]) && !(a[28] ^ b[28]) && !(a[27] ^ b[27]) && !(a[26] ^ b[26]) && !(a[25] ^ b[25]) && !(a[24] ^ b[24]) && !(a[23] ^ b[23]) && !(a[22] ^ b[22]) && !(a[21] ^ b[21]) && !(a[20] ^ b[20]) && !(a[19] ^ b[19]) && !(a[18] ^ b[18]) && !(a[17] ^ b[17]) && !(a[16] ^ b[16]) && a_lt_b2); 

a_gt_b <= a_gt_b1 || (!(a[31] ^ b[31]) && !(a[30] ^ b[30]) && !(a[29] ^ b[29]) && !(a[28] ^ b[28]) && !(a[27] ^ b[27]) && !(a[26] ^ b[26]) && !(a[25] ^ b[25]) && !(a[24] ^ b[24]) && !(a[23] ^ b[23]) && !(a[22] ^ b[22]) && !(a[21] ^ b[21]) && !(a[20] ^ b[20]) && !(a[19] ^ b[19]) && !(a[18] ^ b[18]) && !(a[17] ^ b[17]) && !(a[16] ^ b[16]) && a_gt_b2); 

end
endmodule
