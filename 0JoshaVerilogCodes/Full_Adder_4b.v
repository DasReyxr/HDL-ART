module Full_Adder_4b (A,B,S);

input [3:0] A,B; //4 bits input for A and B
output [4:0] S; //5 bits output for the result
wire [3:0] C; //4 bits wire for the carry out of each bit

//Half adder because the first Cin is 0
assign S[0] = A[0] ^ B[0]; //Sum bit 0
assign C[0] = A[0] & B[0]; //Carry out bit 0

//Full adders for the rest of the bits
assign S[1] = ((A[1] ^ B[1]) ^ C[0]); //Sum bit 1
assign C[1] = (((A[1] ^ B[1]) & C[0]) | (A[1] & B[1])); //Carry out bit 1
assign S[2] = ((A[2] ^ B[2]) ^ C[1]); //Sum bit 2
assign C[2] = (((A[2] ^ B[2]) & C[1]) | (A[2] & B[2])); //Carry out bit 2
assign S[3] = ((A[3] ^ B[3]) ^ C[2]); //Sum bit 3
assign C[3] = (((A[3] ^ B[3]) & C[2]) | (A[3] & B[3])); //Carry out bit 3
assign S[4] = C[3]; //Carry out bit 4

endmodule

