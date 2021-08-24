`include "ckt.v"

module m;

reg [3:0]A;
reg [3:0]B;
wire [7:0]product;
reg clk;
reg reset;
reg start;
wire done;

mult_4bit c(A,B,product,clk,reset,start,done);
/*
always begin
clk <= 1'b0;
//always #1 ck = ~ck;
//repeat(90)
#2 clk <= ~clk;
end
*/

always begin
clk <= 0;
#2;
clk <= 1;
#2;
end

initial begin
//resetting initially
reset <= 0;
start <= 0;
#2
start <= 1;
reset <= 1;

A <= 3;
B <= 6;
#20
$display("a = %d, b = %d, product = %d, done = %d", A,B,product,done);

A <= 13;
B <= 15;
#20
$display("a = %d, b = %d, product = %d, done = %d", A,B,product,done);


A <= 4;
B <= 8;
#20
$display("a = %d, b = %d, product = %d, done = %d", A,B,product,done);

A <= 15;
B <= 15;
#20
$display("a = %d, b = %d, product = %d, done = %d", A,B,product,done);
end


initial begin
$dumpfile("ckt.vcd");
$dumpvars(0,m);
$dumpon;
#1000; 
$dumpoff;
end

endmodule
