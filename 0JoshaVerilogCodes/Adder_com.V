module Adder_com (HA_A, HA_B, HA_P, HA_G,
X_C, X_P, X_S,
Gik_main, Pik_main, Gkj_main, Pkj_main,
BC_N_G, BC_N_P, BC_E_G, BC_E_P, BC_O_G, BC_O_P,
GC_N_G, GC_E_G, GC_O_G, 
B_N_G, B_N_P, B_OE_G, B_OE_P);

input  HA_A, HA_B;
output HA_P, HA_G;

input  X_C, X_P;
output X_S;

input  Gik_main, Pik_main, Gkj_main, Pkj_main;
output BC_N_G, BC_N_P, BC_E_G, BC_E_P, BC_O_G, BC_O_P;
output GC_N_G, GC_E_G, GC_O_G;
output B_N_G, B_N_P,  B_OE_G,B_OE_P;

HA U0 (.A(HA_A),.B(HA_B),.P(HA_P),.G(HA_G));

XOR U1 (.C(X_C),.P(X_P),.S(X_S));

Gray_Normal U2 (.Gik(Gik_main),.Pik(Pik_main),.Gkj(Gkj_main),.Gij(GC_N_G));
Gray_Odd    U3 (.Gik(Gik_main),.Pik(Pik_main),.Gkj(Gkj_main),.Gij(GC_O_G));
Gray_Even   U4 (.Gik(Gik_main),.Pik(Pik_main),.Gkj(Gkj_main),.Gij(GC_E_G));

Black_Normal U5 (.Gik(Gik_main),.Pik(Pik_main),.Gkj(Gkj_main),.Pkj(Pkj_main),.Gij(BC_N_G),.Pij(BC_N_P));
Black_Odd    U6 (.Gik(Gik_main),.Pik(Pik_main),.Gkj(Gkj_main),.Pkj(Pkj_main),.Gij(BC_O_G),.Pij(BC_O_P));
Black_Even   U7 (.Gik(Gik_main),.Pik(Pik_main),.Gkj(Gkj_main),.Pkj(Pkj_main),.Gij(BC_E_G),.Pij(BC_E_P));

Buffer_Normal U8 (.Gij_in(Gik_main),.Pij_in(Pik_main),.Gij_out(B_N_G),.Pij_out(B_N_P));
Buffer_OE     U9 (.Gij_in(Gik_main),.Pij_in(Pik_main),.Gij_out(B_OE_G),.Pij_out(B_OE_P));

endmodule

module HA (A,B,P,G);
input  A,B;
output P,G;

assign P = A ^ B;
assign G = A & B;
endmodule

module XOR (C,P,S);
input  C,P;
output S;

assign S = P ^ C;
endmodule

module Gray_Normal (Gik,Pik,Gkj,Gij);
input  Gik,Pik,Gkj;
output Gij; 

assign Gij = ((Pik & Gkj)|Gik);
endmodule

module Gray_Odd (Gik,Pik,Gkj,Gij);
input  Gik,Pik,Gkj;
output Gij; 

assign Gij = ~((Pik & Gkj)|Gik);
endmodule

module Gray_Even (Gik,Pik,Gkj,Gij);
input  Gik,Pik,Gkj;
output Gij; 

assign Gij = ((~Pik & ~Gkj)| ~Gik);
endmodule

module Black_Normal (Gik,Pik,Gkj,Pkj,Gij,Pij);
input  Gik,Pik,Gkj,Pkj;
output Gij,Pij; 

assign Gij = ((Pik & Gkj)|Gik);
assign Pij = (Pkj & Pik);
endmodule

module Black_Odd (Gik,Pik,Gkj,Pkj,Gij,Pij);
input  Gik,Pik,Gkj,Pkj;
output Gij,Pij; 

assign Gij = ~((Pik & Gkj)|Gik);
assign Pij = ~(Pkj & Pik);
endmodule

module Black_Even (Gik,Pik,Gkj,Pkj,Gij,Pij);
input  Gik,Pik,Gkj,Pkj;
output Gij,Pij; 

assign Gij = ((~Pik & ~Gkj)| ~Gik);
assign Pij = (~Pkj & ~Pik);
endmodule

module Buffer_Normal (Gij_in,Pij_in,Gij_out,Pij_out);
input  Gij_in,Pij_in;
output Gij_out,Pij_out;

assign Gij_out = Gij_in;
assign Pij_out = Pij_in;
endmodule

module Buffer_OE (Gij_in,Pij_in,Gij_out,Pij_out);
input  Gij_in,Pij_in;
output Gij_out,Pij_out;

assign Gij_out = ~Gij_in;
assign Pij_out = ~Pij_in;
endmodule