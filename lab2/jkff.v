`define delay #2

module jkff(clk,rst,J,K,Q);
input clk,rst,J,K;
output Q;
reg Q;
/*
initial begin
Q <= 0;
end
*/
//or negedge rst
always @ (posedge clk) begin
//rst is active low
if(!rst)
 Q <= `delay 0;

else if(rst & J == 1 & K == 1)

 Q <= !Q;
else if(rst & J == 0 & K == 1)

 Q <=   0;
else if(rst & J == 1 & K == 0)

 Q <=   1;


else if(rst & J == 0 & K == 0)

 Q <=   Q;



end	

endmodule

