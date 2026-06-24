module exam (A,B,C,X,Y,Z);
input A,B,C;
output X,Y,Z;

assign X = A | B & C;
assign Y = A | (B & C);
assign Z = (A | B) & C;

endmodule