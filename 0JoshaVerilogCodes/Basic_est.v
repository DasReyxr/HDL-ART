module Bit_Wise (A,B,Cin,G,P,Cin_O);

input  [15:0] A,B;
input  Cin;
output [15:0] G,P;
output Cin_O;
wire   [15:0] G_s,P_s;

HA U0  (.A(A[0]) ,.B(B[0]) ,.G(G_s[0]) ,.P(P_s[0]));
HA U1  (.A(A[1]) ,.B(B[1]) ,.G(G_s[1]) ,.P(P_s[1]));
HA U2  (.A(A[2]) ,.B(B[2]) ,.G(G_s[2]) ,.P(P_s[2]));
HA U3  (.A(A[3]) ,.B(B[3]) ,.G(G_s[3]) ,.P(P_s[3]));
HA U4  (.A(A[4]) ,.B(B[4]) ,.G(G_s[4]) ,.P(P_s[4]));
HA U5  (.A(A[5]) ,.B(B[5]) ,.G(G_s[5]) ,.P(P_s[5]));
HA U6  (.A(A[6]) ,.B(B[6]) ,.G(G_s[6]) ,.P(P_s[6]));
HA U7  (.A(A[7]) ,.B(B[7]) ,.G(G_s[7]) ,.P(P_s[7]));
HA U8  (.A(A[8]) ,.B(B[8]) ,.G(G_s[8]) ,.P(P_s[8]));
HA U9  (.A(A[9]) ,.B(B[9]) ,.G(G_s[9]) ,.P(P_s[9]));
HA U10 (.A(A[10]),.B(B[10]),.G(G_s[10]),.P(P_s[10]));
HA U11 (.A(A[11]),.B(B[11]),.G(G_s[11]),.P(P_s[11]));
HA U12 (.A(A[12]),.B(B[12]),.G(G_s[12]),.P(P_s[12]));
HA U13 (.A(A[13]),.B(B[13]),.G(G_s[13]),.P(P_s[13]));
HA U14 (.A(A[14]),.B(B[14]),.G(G_s[14]),.P(P_s[14]));
HA U15 (.A(A[15]),.B(B[15]),.G(G_s[15]),.P(P_s[15]));

assign G = G_s;
assign P = P_s;

assign Cin_O = Cin;

endmodule

module HA (A,B,P,G);
input  A,B;
output P,G;

assign P = A ^ B;
assign G = A & B;
endmodule