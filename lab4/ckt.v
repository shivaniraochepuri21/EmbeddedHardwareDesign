`include "full.v"

module mult_4bit(A,B,product,clk,reset,start,done);

input [3:0]A;
input [3:0]B;
input start,clk,reset;
output reg  done = 0;
reg state1;
reg state2;
wire [15:0]arr;
wire [15:0]s;
wire [15:0]ci;
reg [15:0]r;
reg [15:0]r1;
output reg [7:0]product;
//r2_8 has the final carry 
reg r2_8;
wire s_16;

assign arr[0] = A[0] & B[0]; 
assign arr[1] = A[1] & B[0];
assign arr[2] = A[0] & B[1]; 
assign arr[3] = B[0] & A[2]; 
assign arr[4] = B[1] & A[1]; 
assign arr[5] = A[0] & B[2];
assign arr[6] = A[3] & B[0];
assign arr[7] = A[2] & B[1];
assign arr[8] = A[1] & B[2];
assign arr[9] = A[0] & B[3];
assign arr[10] = A[3] & B[1];
assign arr[11] = A[2] & B[2];
assign arr[12] = A[1] & B[3];
assign arr[13] = A[3] & B[2];
assign arr[14] = A[2] & B[3];
assign arr[15] = B[3] & A[3];

assign s[0] = arr[0];

hf hf1(arr[1], arr[2], s[1], ci[0]);
full f1(arr[3], arr[4], arr[5], s[2], ci[1]);
full f2(arr[6], arr[7], arr[8], s[3], ci[2]);
full f3(arr[10], arr[11], arr[12], s[4], ci[3]);
hf hf2(arr[13], arr[14], s[5], ci[4]);
assign s[6] = arr[15];

//pipe 1
hf hf3(r[2], r[7], s[7], ci[5]);
full f4(r[3], r[8], r[13], s[8], ci[6]);
hf hf4(r[4], r[9], s[9], ci[7]);
hf hf5(r[5], r[10], s[10], ci[8]);
hf hf6(r[12], r[11], s[11], ci[9]); //r12 is s6

//pipe 2
hf hf7(r1[1],r1[5],s[12],ci[10]);
full f5(r1[2],r1[6],ci[10],s[13],ci[11]);
full f6(r1[3],r1[7],ci[11],s[14],ci[12]);
full f7(r1[4],r1[8],ci[12],s[15],ci[13]);
hf hf8(r1[9],ci[13],s_16,ci[14]); 

always @(start == 0 || reset == 0)
begin
done <= 0;
state1 <= 0;
state2 <= 0;
product <= 0;
end
/*
always @(start == 1 && done == 1)
begin
done <= 0;
#2
done <= 1;
end
*/

always@(posedge clk)
begin
if(reset == 1 && start == 1 && state1 == 0)
begin
r[5:0] <= s[5:0];	
r[6] <= arr[15];
r[11:7] <= ci[4:0];
r[12] <= s[6];
r[13] <= arr[9];
state1 <= 1;
end

if (reset == 1 && start == 1 && state1 == 1 && state2 == 0)
begin
	r1[4:0] <= s[11:7];
	r1[9:5] <= ci[9:5];
        r1[10] <= r[0];
	r1[11] <= r[1];	
	state1 <= 0;
	state2 <= 1;
end

if (reset == 1 && start == 1 && state2 == 1)
begin
	product[0] <= r1[10];
	product[1] <= r1[11];
	product[2] <= r1[0];
	product[6:3] <= s[15:12];
	product[7] <= s_16;
	r2_8 <= ci[14];
	done <= 1;
	state2 <= 0;
end
end
/*
always @(done == 1 && state2 == 0 or posedge clk)
begin
done <= 0;
//#2
//done <= 1;
end
*/
endmodule
