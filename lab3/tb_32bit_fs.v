`include "32bit_fs.v"
module m;
//reg c0;
reg [31:0]x;
reg [31:0]y;
wire [31:0] _sm;
wire [31:0] _car;

mod ob(x,y,_sm,_car);

initial begin
//c0 <= 0;
x <= 32'b11000000000011111100000011110000;
y <= 32'b00110000000011111100000011110000;
#10
$display("difference_binary = %b\ndifference_decimal value = %d",_sm,_sm);
$display("borrow_binary = %b",_car);
end

initial begin
$dumpfile("sub_32bit.vcd");
$dumpvars;
$dumpon;
#1000 $dumpoff;
end
endmodule
