`include "gcd_mach.v"
module testbench;
reg clk_t,go_t,rst_t;
reg [31:0] in1_t,in2_t;
wire [31:0] out_t;
wire done_t;

gcd_mach g1(clk_t,rst_t,go_t,in1_t,in2_t,out_t,done_t);

always begin
clk_t <= 0;
#20;
clk_t <= 1;
#20;
end

initial begin
//reset
rst_t <= 1;
go_t <= 0;
#80
rst_t <= 0;
#2

in1_t <= 32'b1111;
in2_t <= 32'b1000;
#2
//gcd(10,5) = 5
go_t <= 1;
while (done_t == 1) begin #2; end
go_t <= 0;
while (done_t != 1) begin #2; end
$display("done = %b, out = %b",done_t,out_t);

/*
#5
in1_t <= 32'b101;
in2_t <= 32'b101;
#80
//gcd(100,40) = 20

go_t <= 1;
while (done_t == 1)  #40; // end
go_t <= 0;
while (done_t != 1)  #40;  //end

$display("done = %b, out_binary = %b\nout_decimal = %d",done_t,out_t,out_t);
*/
#400;
//$finish;
//end
end

initial begin
$dumpfile("gcdop.vcd");
$dumpvars(0,g1);
$dumpon;
#20000; 
$dumpoff;
end

endmodule
