module Bit_Wise #(parameter N=15) (A,B,Cin,G,P,Cin_O);

input  [N:0] A,B;
input  Cin;
output [N:0] G,P;
output Cin_O;
wire   [N:0] G_s,P_s;

genvar i; //Intern variable

generate
    for (i=0; i<=N; i=i+1) begin
        HA U0  (.A(A[i]) ,.B(B[i]) ,.G(G_s[i]) ,.P(P_s[i]));
    end
endgenerate

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