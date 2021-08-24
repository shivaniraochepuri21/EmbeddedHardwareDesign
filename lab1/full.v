`include "hf.v"
module full (x1, y1, z1, sum2, car);
//input x1;
//input y1;
//input z1;
//module f;
input x1,y1,z1;
output wire sum1,carry1,sum2,carry2,car;
hf ob1(.x(x1),.y(y1),.sum(sum1),.carry(carry1));
hf ob2(.x(sum1),.y(z1),.sum(sum2),.carry(carry2));
assign car = carry1 || carry2;
//assign carry1 = carry;
//endmodule
endmodule
