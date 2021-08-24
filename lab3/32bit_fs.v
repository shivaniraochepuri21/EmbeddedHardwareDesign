`include "4bit_fs.v"

///msb is _A31 and lsb is _A0

module mod(a,b,sm,car);

//input _car0;
input [31:0] a;
input [31:0] b;
output wire [31:0] sm;
output wire [31:0] car;

bit4_fs obj1(.A0(a[0]),.A1(a[1]),.A2(a[2]),.A3(a[3]),.B0(b[0]),.B1(b[1]),.B2(b[2]),.B3(b[3]),.sm0(sm[0]),.sm1(sm[1]),.sm2(sm[2]),.sm3(sm[3]),.car0(1'b0),.car1(car[0]),.car2(car[1]),.car3(car[2]),.car4(car[3]));



bit4_fs obj2(.A0(a[4]),.A1(a[5]),.A2(a[6]),.A3(a[7]),.B0(b[4]),.B1(b[5]),.B2(b[6]),.B3(b[7]),.sm0(sm[4]),.sm1(sm[5]),.sm2(sm[6]),.sm3(sm[7]),.car0(car[3]),.car1(car[4]),.car2(car[5]),.car3(car[6]),.car4(car[7]));



bit4_fs obj3(.A0(a[8]),.A1(a[9]),.A2(a[10]),.A3(a[11]),.B0(b[8]),.B1(b[9]),.B2(b[10]),.B3(b[11]),.sm0(sm[8]),.sm1(sm[9]),.sm2(sm[10]),.sm3(sm[11]),.car0(car[7]),.car1(car[8]),.car2(car[9]),.car3(car[10]),.car4(car[11]));



bit4_fs obj4(.A0(a[12]),.A1(a[3]),.A2(a[14]),.A3(a[15]),.B0(b[12]),.B1(b[13]),.B2(b[14]),.B3(b[15]),.sm0(sm[12]),.sm1(sm[13]),.sm2(sm[14]),.sm3(sm[15]),.car0(car[11]),.car1(car[12]),.car2(car[13]),.car3(car[14]),.car4(car[15]));




bit4_fs obj5(.A0(a[16]),.A1(a[17]),.A2(a[18]),.A3(a[19]),.B0(b[16]),.B1(b[17]),.B2(b[18]),.B3(b[19]),.sm0(sm[16]),.sm1(sm[17]),.sm2(sm[18]),.sm3(sm[19]),.car0(car[15]),.car1(car[16]),.car2(car[17]),.car3(car[18]),.car4(car[19]));



bit4_fs obj6(.A0(a[20]),.A1(a[21]),.A2(a[22]),.A3(a[23]),.B0(b[20]),.B1(b[21]),.B2(b[22]),.B3(b[23]),.sm0(sm[20]),.sm1(sm[21]),.sm2(sm[22]),.sm3(sm[23]),.car0(car[19]),.car1(car[20]),.car2(car[21]),.car3(car[22]),.car4(car[23]));



bit4_fs obj7(.A0(a[24]),.A1(a[25]),.A2(a[26]),.A3(a[27]),.B0(b[24]),.B1(b[25]),.B2(b[26]),.B3(b[27]),.sm0(sm[24]),.sm1(sm[25]),.sm2(sm[26]),.sm3(sm[27]),.car0(car[23]),.car1(car[24]),.car2(car[25]),.car3(car[26]),.car4(car[27]));


bit4_fs obj8(.A0(a[28]),.A1(a[29]),.A2(a[30]),.A3(a[31]),.B0(b[28]),.B1(b[29]),.B2(b[30]),.B3(b[31]),.sm0(sm[28]),.sm1(sm[29]),.sm2(sm[30]),.sm3(sm[31]),.car0(car[27]),.car1(car[28]),.car2(car[29]),.car3(car[30]),.car4(car[31]));

endmodule
