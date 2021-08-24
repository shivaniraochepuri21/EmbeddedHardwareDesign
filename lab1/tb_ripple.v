`include "ripple.v"

module tb_ripple;

reg _A0,_A1,_A2,_A3,_B0,_B1,_B2,_B3;
output wire _sm0,_sm1,_sm2,_sm3;
output wire _car1,_car2,_car3,_car4;
reg _car0;

//ripple obj1(.A(a),.B(b),.C(c),.S1(s1),.C2(c2));

ripple rp(.A0(_A0),.A1(_A1),.A2(_A2),.A3(_A3),.B0(_B0),.B1(_B1),.B2(_B2),.B3(_B3),.sm0(_sm0),.sm1(_sm1),.sm2(_sm2),.sm3(_sm3),.car0(_car0),.car1(_car1),.car2(_car2),.car3(_car3),.car4(_car4));

//ripple adder - a testcase
initial begin

$display("\nFor test cases in the tb_ripple.v file, the 4-bit ripple adder output:");

_A3 = 1;_A2 = 0;_A1 = 1;_A0 = 1;

_B3 = 0;_B2 = 0;_B1 = 1;_B0 = 1;
_car0 = 0;
#10
$display("sum = %b%b%b%b, carry = %b%b%b%b",_sm3,_sm2,_sm1,_sm0,_car4,_car3,_car2,_car1); 



_A3 = 1;_A2 = 0;_A1 = 1;_A0 = 1;

_B3 = 0;_B2 = 1;_B1 = 1;_B0 = 1;
_car0 = 0;
#10
$display("sum = %b%b%b%b, carry = %b%b%b%b",_sm3,_sm2,_sm1,_sm0,_car4,_car3,_car2,_car1); 



_A3 = 1;_A2 = 0;_A1 = 0;_A0 = 1;

_B3 = 1;_B2 = 0;_B1 = 0;_B0 = 1;
_car0 = 0;
#10
$display("sum = %b%b%b%b, carry = %b%b%b%b",_sm3,_sm2,_sm1,_sm0,_car4,_car3,_car2,_car1); 



_A3 = 1;_A2 = 0;_A1 = 0;_A0 = 0;

_B3 = 0;_B2 = 1;_B1 = 1;_B0 = 1;
_car0 = 0;
#10
$display("sum = %b%b%b%b, carry = %b%b%b%b",_sm3,_sm2,_sm1,_sm0,_car4,_car3,_car2,_car1); 

end

initial begin	
 $dumpfile("tb_ripple.vcd");
 $dumpvars(0,tb_ripple);
 end

endmodule
