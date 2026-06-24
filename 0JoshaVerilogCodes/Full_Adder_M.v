module Full_Adder_M (A,B,Cin,S,Cout);

input A,B,Cin; //3 bits input
output S,Cout; //2 outputs

wire S1,S2,S3; //Internal wires

assign S1 = A ^ B;
assign S2 = A  & B;
assign S3 = S1 & Cin;

assign Cout = S2 | S3;
assign S = S1 ^ Cin;

endmodule
