module Sum_Logic #(parameter N=15) (C,P,G,S,Cout);

input  [N:0] C,P;
input  G;
output [N:0] S;
output Cout;
wire   [N:0] S_s;
wire   CO_s;

genvar i; //Intern variable

generate
    for (i=0; i<=N; i=i+1) begin
        XOR U1 (.C(C[i]),.P(P[i]),.S(S_s[i]));
    end
endgenerate

Gray_Odd U2 (.Gik(G),.Pik(P[15]),.Gkj(C[15]),.Gij(CO_s));
INVX U3 (.A(CO_s),.Z(Cout));

assign S = S_s;

endmodule

module XOR (C,P,S);
input  C,P;
output S;

assign S = P ^ C;
endmodule

module Gray_Odd (Gik,Pik,Gkj,Gij);
input  Gik,Pik,Gkj;
output Gij; 

assign Gij = ~((Pik & Gkj)|Gik);
endmodule

module INVX (A,Z);
input  A;
output Z;

assign Z = ~A;
endmodule