//rst active low

module pulse(in,out,rst);
input in;
//reg out;
output out;
input rst;
reg [2:0] st;

assign out = st[2] && !st[1] && !st[0];
/*
initial begin
out = 3'b0;
end
*/ 
always @ (posedge in or negedge rst )
begin
if(!rst) begin // rst = 0
	st = 3'b000;
end
else begin
	if(st != 3'b100) 
	begin
		st <= st + 1'b1;
	end
	else
	begin
		st <= 3'b001;
	end
end
end	
endmodule
