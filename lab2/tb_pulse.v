`include "pulse.v"
module m;

pulse p(.in(i),.out(o),.rst(r));
/*
reg i1,r1;
wire o1;

pulse p1(.in(i1),.out(o1),.rst(r1));
*/
reg i;
wire o;
reg r;

initial begin

i = 1; r = 1; #12; $display("out = %b",o);

i = 0; r = 1; #2; $display("out = %b",o);

i = 1; r = 1; #16; $display("out = %b",o);

i = 0; r = 1; #4; $display("out = %b",o);

i = 1; r = 1; #8; $display("out = %b",o);

i = 0; r = 1; #6; $display("out = %b",o);

i = 1; r = 1; #6; $display("out = %b",o);

i = 1; r = 1; #12; $display("out = %b",o);

i = 0; r = 1; #2; $display("out = %b",o);

i = 1; r = 1; #8; $display("out = %b",o);

i = 0; r = 1; #10; $display("out = %b",o);

i = 1; r = 1; #20; $display("out = %b",o);

i = 0; r = 1; #6; $display("out = %b",o);

i = 1; r = 1; #8; $display("out = %b",o);

i = 0; r = 1; #12; $display("out = %b",o);

i = 1; r = 1; #4; $display("out = %b",o);

i = 0; r = 1; #8; $display("out = %b",o);

i = 1; r = 0; #12; $display("out = %b",o);

i = 0; r = 0; #4; $display("out = %b",o);

i = 1; r = 0; #8;$display("out = %b",o);

end

initial 
begin	
 $dumpfile("tb_pulse.vcd");
 $dumpvars(0,m);
end

endmodule

/*
//module m1;

initial begin
//#36
i1 = 1; r1 = 1; #2; $display("%b",o1);

i1 = 0; r1 = 1; #12; $display("%b",o1);

i1 = 1; r1 = 1; #6; $display("%b",o1);

i1 = 0; r1 = 1; #14; $display("%b",o1);

i1 = 1; r1 = 1; #18; $display("%b",o1);

i1 = 0; r1 = 1; #6; $display("%b",o1);

i1 = 1; r1 = 1; #16; $display("%b",o1);

i1 = 1; r1 = 1; #2; $display("%b",o1);

i1 = 0; r1 = 1; #12; $display("%b",o1);

i1 = 1; r1 = 1; #8; $display("%b",o1);

i1 = 0; r1 = 1; #10; $display("%b",o1);

i1 = 1; r1 = 1; #12; $display("%b",o1);

i1 = 0; r1 = 1; #16; $display("%b",o1);

i1 = 1; r1 = 1; #8; $display("%b",o1);

i1 = 0; r1 = 1; #2; $display("%b",o1);

i1 = 1; r1 = 1; #4; $display("%b",o1);

i1 = 0; r1 = 1; #8; $display("%b",o1);

i1 = 1; r1 = 0; #2; $display("%b",o1);

i1 = 0; r1 = 0; #14; $display("%b",o1);

i1 = 1; r1 = 0; #2;$display("%b",o1);

end

initial 
begin	
 $dumpfile("tb_pulse.vcd");
 $dumpvars(0,m1);
end

endmodule
*/
