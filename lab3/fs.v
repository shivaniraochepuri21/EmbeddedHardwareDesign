module fs(X,Y,Z,diff,borrow);
input X,Y,Z;
output reg diff,borrow;
always @(X or Y or Z)
begin
diff <= ~X && ~Y && Z || ~X && Y && ~Z || X && ~Y && ~Z || X && Y && Z;

borrow <= ~X && Z || ~X && Y || Y && Z;
end
endmodule
