//`include "dutf.v"
`include "muxfile.v"
module mod;
//the given boolean function can be reduced to BC(A+D);
muxfile func(.sel(D),.in0(A),.in1(1),.out(Y1));
muxfile func1(.sel(C),.in0(0),.in1(B),.out(Y2));
muxfile func2(.sel(Y2),.in0(0),.in1(Y1),.out(Y));
//input A,B,C,D;
output Y1,Y2,Y;
reg A;
reg B;
reg C;
reg D;
wire Y1;
wire Y2;
wire Y; 

//end module

//module mod;
initial begin
A = 0;B = 0;C = 0;D = 0;
#10
$display("%b",Y);

A = 0;B = 0;C = 0;D = 1;
#10
$display("%b",Y);

A = 0;B = 0;C = 1;D = 0;
#10
$display("%b",Y);

A = 0;B = 0;C = 1;D = 1;
#10
$display("%b",Y);

A = 0;B = 1;C = 0;D = 0;
#10
$display("%b",Y);

A = 0;B = 1;C = 0;D = 1;
#10
$display("%b",Y);

A = 0;B = 1;C = 1;D = 0;
#10
$display("%b",Y);

A = 0;B = 1;C = 1;D = 1;
#10
$display("%b",Y);

A = 1;B = 0;C = 0;D = 0;
#10
$display("%b",Y);

A = 1;B = 0;C = 0;D = 1;
#10
$display("%b",Y);

A = 1;B = 0;C = 1;D = 0;
#10
$display("%b",Y);

A = 1;B = 0;C = 1;D = 1;
#10
$display("%b",Y);

A = 1;B = 1;C = 0;D = 0;
#10
$display("%b",Y);

A = 1;B = 1;C = 0;D = 1;
#10
$display("%b",Y);

A = 1;B = 1;C = 1;D = 0;
#10
$display("%b",Y);

A = 1;B = 1;C = 1;D = 1;
#10
$display("%b",Y);

end

initial
 begin
 $dumpfile("t1.vcd");
  $dumpvars(0,mod);
 end

endmodule
