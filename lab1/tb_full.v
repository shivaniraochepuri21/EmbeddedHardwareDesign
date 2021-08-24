`include "full.v"

module tb_full;
reg a,b,c;
output wire s1,c2;

full obj1(.x1(a),.y1(b),.z1(c),.sum2(s1),.car(c2));

//full adder
initial begin
$display("Test cases for a Full Adder");
a = 0; b = 0; c = 0;
#10
$display("carry = %b, sum = %b",c2,s1);

a = 0; b = 0; c = 1;
#10
$display("carry = %b, sum = %b",c2,s1);

a = 0; b = 1; c = 0;
#10
$display("carry = %b, sum = %b",c2,s1);

a = 0; b = 1; c = 1;
#10
$display("carry = %b, sum = %b",c2,s1);

a = 1; b = 0; c = 0;
#10
$display("carry = %b, sum = %b",c2,s1);

a = 1; b = 0; c = 1;
#10
$display("carry = %b, sum = %b",c2,s1);

a = 1; b = 1; c = 0;
#10
$display("carry = %b, sum = %b",c2,s1);

a = 1; b = 1; c = 1;
#10
$display("carry = %b, sum = %b\n",c2,s1);
end


initial begin	
 $dumpfile("tb_full.vcd");
 $dumpvars(0,tb_full);
 end

endmodule
