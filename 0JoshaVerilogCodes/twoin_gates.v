module twoin_gates (A,B,Z);

input A,B;      //2 bits input A and B
output [6:0] Z; //7 bits output

assign Z[0] = ~A; //NOT
assign Z[1] = A & B; //AND
assign Z[2] = ~(A & B); //NAND
assign Z[3] = A | B; //OR
assign Z[4] = ~(A | B); //NOR
assign Z[5] = A ^ B; //XOR 
assign Z[6] = ~(A ^ B); //XNOR

endmodule