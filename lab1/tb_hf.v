`include "hf.v"

module tb_hf;
reg a1,b1;
output wire shf,chf;

hf h(.x(a1),.y(b1),.sum(shf),.carry(chf));

initial begin

//half adder
$display("4 Test cases answers for a Half Adder");
a1 = 0;b1 = 0;
#10
$display("carry = %b, sum = %b",chf,shf);

a1 = 0;b1 = 1;
#10
$display("carry = %b, sum = %b",chf,shf);

a1 = 1;b1 = 0;
#10
$display("carry = %b, sum = %b",chf,shf);

a1 = 1;b1 = 1;
#10
$display("carry = %b, sum = %b\n",chf,shf);
end


initial begin	
 $dumpfile("tb_hf.vcd");
 $dumpvars(0,tb_hf);
 end

endmodule
