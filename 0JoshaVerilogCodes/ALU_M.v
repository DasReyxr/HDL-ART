// Main ALU module
module ALU_M(A,B,sel,Z,zero,carry,sign);

input [7:0] A,B; // 8-bit inputs
input [2:0] sel; // 3-bit select line
output [7:0] Z; // 8-bit output
output zero,carry,sign; // bitFlags

wire [7:0] AoS,AND,OR,XOR,NOT,LLS,LRS; // Intermediate wires for each operation
wire [8:0] TC; // Output from subtraction
wire CoB, Enable_S;

// Instantiate each operation module
ADD_8b U0(.A(A),.B(TC),.Cin(Enable_S),.S(AoS),.Cout(CoB));
TC_8b  U1(.A(B),.Enable(Enable_S),.Z(TC));
AND_8b U2(.A(A),.B(B),.Z(AND));
OR_8b  U3(.A(A),.B(B),.Z(OR));
XOR_8b U4(.A(A),.B(B),.Z(XOR));
NOT_8b U5(.A(A),.Z(NOT));
LLS_8b U6(.A(A),.Z(LLS));
LRS_8b U7(.A(A),.Z(LRS));

assign Enable_S = (~sel[2]) & (~sel[1]) & (sel[0]); // Enable signal for addition/subtraction
assign carry = ((~sel[2]) & (~sel[1]) & (~sel[0])) & CoB; // Carry flag only for addition
assign sign = ((~sel[2]) & (~sel[1]) & (sel[0])) & CoB;
assign zero = ~(|Z); // Zero flag

assign Z = (sel == 3'b000) ? AoS :
           (sel == 3'b001) ? AoS : // Subtraction uses the same output as addition
           (sel == 3'b010) ? AND :
           (sel == 3'b011) ? OR :
           (sel == 3'b100) ? XOR :
           (sel == 3'b101) ? NOT :
           (sel == 3'b110) ? LLS :
           (sel == 3'b111) ? LRS : 8'b00000000; // Default case            
endmodule

//8-bit Adder
module ADD_8b(A,B,Cin,S,Cout);
input [7:0] A;
input [8:0] B;
input Cin;
output [7:0] S;
output Cout;
wire  [7:0] CO_S;
wire dummy;

FA U0(.A(A[0]),.B(B[0]),.Cin(Cin)    ,.S(S[0]),.Cout(CO_S[0]));
FA U1(.A(A[1]),.B(B[1]),.Cin(CO_S[0]),.S(S[1]),.Cout(CO_S[1]));
FA U2(.A(A[2]),.B(B[2]),.Cin(CO_S[1]),.S(S[2]),.Cout(CO_S[2]));
FA U3(.A(A[3]),.B(B[3]),.Cin(CO_S[2]),.S(S[3]),.Cout(CO_S[3]));
FA U4(.A(A[4]),.B(B[4]),.Cin(CO_S[3]),.S(S[4]),.Cout(CO_S[4]));
FA U5(.A(A[5]),.B(B[5]),.Cin(CO_S[4]),.S(S[5]),.Cout(CO_S[5]));
FA U6(.A(A[6]),.B(B[6]),.Cin(CO_S[5]),.S(S[6]),.Cout(CO_S[6]));
FA U7(.A(A[7]),.B(B[7]),.Cin(CO_S[6]),.S(S[7]),.Cout(CO_S[7]));
FA U8(.A(1'b0),.B(B[8]),.Cin(CO_S[7]),.S(Cout),.Cout(dummy)); 
endmodule

//8-bit Full Adder
module FA (A,B,S,Cin,Cout);
input A,B,Cin;
output S,Cout;

assign S = (A ^ B) ^ Cin;
assign Cout = (A & B) | ((A ^ B) & Cin);
endmodule

//8-bit twos complement
module TC_8b(A,Enable,Z);
input [7:0] A;
input Enable;
output [8:0] Z;
wire [8:0] A_1; //Add the sign bit

assign A_1[8] = 1'b0; 
assign A_1[7:0] = A;
assign Z = A_1 ^ {9{Enable}}; // If Enable is 1, invert bits
endmodule

//8-bit AND
module AND_8b(A,B,Z);
input [7:0] A,B;
output [7:0] Z;

assign Z = A & B;
endmodule

//8-bit OR
module OR_8b(A,B,Z);
input [7:0] A,B;
output [7:0] Z;

assign Z = A | B;
endmodule

//8-bit XOR
module XOR_8b(A,B,Z);
input [7:0] A,B;
output [7:0] Z;

assign Z = A ^ B;
endmodule

//8-bit NOT
module NOT_8b(A,Z);
input [7:0] A;
output [7:0] Z;

assign Z = ~A;
endmodule

//8-bit Logical Left Shift
module LLS_8b(A,Z);
input [7:0] A;
output [7:0] Z;

assign Z = A << 1;
endmodule

//8-bit Logical Right Shift
module LRS_8b(A,Z);
input [7:0] A;
output [7:0] Z;

assign Z = A >> 1;
endmodule