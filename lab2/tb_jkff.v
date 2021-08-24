`include "jkff.v"
`define pul #1;
`define d #10;
module dut;

jkff obj(.clk(ck),.rst(rs),.J(j),.K(k),.Q(q));

reg ck,rs,j,k;
wire q;
initial begin
ck = 1'b0;
//#1 ck <= ~ck;
//end
repeat(90)
#1 ck = ~ck;
end
/*
initial begin
ck = 1'b0;
end

initial 100 $finish;
always #1 ck = ~ck;
*/

initial begin

j = 0; k = 1; rs = 1;
#5
$display("rs = 1  j = 0  k = 1  q = %b",q);

j = 1; k = 0; rs = 1;
#10
$display("rs = 1  j = 1  k = 0  q = %b",q);
/*
j = 1; k = 1; rs = 1;
#15
$display("rs = 1  j = 1  k = 1  q = %b",q);
*/

j = 0; k = 0; rs = 1;
#5
$display("rs = 1  j = 0  k = 0  q = %b",q);	

j = 0; k = 1; rs = 1;
#5
$display("rs = 1  j = 0  k = 1  q = %b",q);

j = 0; k = 0; rs = 1;
#10
$display("rs = 1  j = 0  k = 0  q = %b",q);	

j = 0; k = 1; rs = 1;
#5
$display("rs = 1  j = 0  k = 1  q = %b",q);

j = 1; k = 1; rs = 1;
#10
$display("rs = 1  j = 1  k = 1  q = %b",q);

j = 0; k = 1; rs = 0;
#15
$display("rs = 0  j = 0  k = 1  q = %b",q);

j = 1; k = 0; rs = 0;
#5
$display("rs = 0  j = 1  k = 0  q = %b",q);

j = 1; k = 1; rs = 0;
#5
$display("rs = 0  j = 1  k = 1  q = %b",q);

end

initial begin	
 $dumpfile("tb_jkff.vcd");
 $dumpvars(0,dut);
$dumpon;
#200;
$dumpoff;
end

endmodule				
