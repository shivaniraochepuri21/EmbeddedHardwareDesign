`include "full.v"
module ripple(A0,A1,A2,A3,B0,B1,B2,B3,sm0,sm1,sm2,sm3,car0,car1,car2,car3,car4);
input A0,A1,A2,A3,B0,B1,B2,B3;
output wire sm0,sm1,sm2,sm3;
output wire car1,car2,car3,car4;
input car0;

full o1(.x1(A0),.y1(B0),.z1(car0),.sum2(sm0),.car(car1));
full o2(.x1(A1),.y1(B1),.z1(car1),.sum2(sm1),.car(car2));
full o3(.x1(A2),.y1(B2),.z1(car2),.sum2(sm2),.car(car3));
full o4(.x1(A3),.y1(B3),.z1(car3),.sum2(sm3),.car(car4));

endmodule

