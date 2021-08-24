`include "fs.v"
module bit4_fs(A0,A1,A2,A3,B0,B1,B2,B3,sm0,sm1,sm2,sm3,car0,car1,car2,car3,car4);
input A0,A1,A2,A3,B0,B1,B2,B3;
output wire sm0,sm1,sm2,sm3;
output wire car1,car2,car3,car4;
input car0;
output reg V;

fs o1(.X(A0),.Y(B0),.Z(car0),.diff(sm0),.borrow(car1));
fs o2(.X(A1),.Y(B1),.Z(car1),.diff(sm1),.borrow(car2));
fs o3(.X(A2),.Y(B2),.Z(car2),.diff(sm2),.borrow(car3));
fs o4(.X(A3),.Y(B3),.Z(car3),.diff(sm3),.borrow(car4));

always @(*)begin
V <= (car3 && ~car4) || (~car3 && car4);
end
endmodule

