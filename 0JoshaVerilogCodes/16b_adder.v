module sixtbadder (A,B,Cin,S,Cout,Sum);

input  [15:0] A,B;
input  Cin;
output [15:0] S;
output [16:0]Sum;
output Cout;

wire Carry2HC;
wire [15:0] G_signal,P_signal,C2SL;
wire [14:0] G_Aux,P_Aux;
wire MSB_G,MSB_P;

Bit_Wise    U111 (.A(A),.B(B),.Cin(Cin),.G(G_signal),.P(P_signal),.Cin_O(Carry2HC));
assign G_Aux = G_signal[14:0];
assign P_Aux = P_signal[14:0];
assign MSB_G = G_signal[15];
assign MSB_P = P_signal[15];
Han_Carlson U222 (.P(P_Aux),.G(G_Aux),.Cin(Carry2HC),.C(C2SL));
Sum_Logic   U333 (.C(C2SL),.P(P_signal),.G(MSB_G),.S(S),.Cout(Cout));

assign Sum[15:0] = S; 
assign Sum[16] = Cout;

endmodule

//BIT WISE
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

//HAN_CARLSON
module Han_Carlson (P,G,Cin,C);

input  [14:0] P,G;
input  Cin;
output [15:0] C;

wire [15:0] C_s;
wire S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,
     S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,
     S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,
     S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,
     S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,
     S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,
     S60,S61,S62,S63,S64;

//Stage 1
Buffer_Single U10 (.Gij_in(Cin),.Gij_out(C_s[0]));

//Stage 2
Gray_Odd U11 (.Gik(G[0]),.Pik(P[0]),.Gkj(Cin),.Gij(S0));
INVX     U12 (.A(S0),.Z(C_s[1]));

//Stage 2&10
INVX U13 (.A(C_s[1]),.Z(S1));

//Stage 3
Buffer_Normal U14 (.Gij_in(G[1]),.Pij_in(P[1]),.Gij_out(S2),.Pij_out(S3));
Gray_Odd      U15 (.Gik(S2),.Pik(S3),.Gkj(C_s[1]),.Gij(S4));
INVX          U16 (.A(S4),.Z(C_s[2]));

//Stage 4
Black_Odd U17 (.Gik(G[2]),.Pik(P[2]),.Gkj(G[1]),.Pkj(P[1]),.Gij(S5),.Pij(S6));
Gray_Even U18 (.Gik(S5),.Pik(S6),.Gkj(S0),.Gij(S7));
INVX      U19 (.A(S7),.Z(S8));
INVX      U20 (.A(S8),.Z(C_s[3]));

//Stage 5
Buffer_Normal U21 (.Gij_in(G[3]),.Pij_in(P[3]),.Gij_out(S9),.Pij_out(S10));
Gray_Odd      U22 (.Gik(S9),.Pik(S10),.Gkj(C_s[3]),.Gij(S11));
INVX          U23 (.A(S11),.Z(C_s[4]));

//Stage 6
Black_Odd  U24 (.Gik(G[4]),.Pik(P[4]),.Gkj(G[3]),.Pkj(P[3]),.Gij(S12),.Pij(S13));
Black_Even U25 (.Gik(S12),.Pik(S13),.Gkj(S5),.Pkj(S6),.Gij(S14),.Pij(S15));
Gray_Odd   U26 (.Gik(S14),.Pik(S15),.Gkj(C_s[1]),.Gij(S16));
INVX       U27 (.A(S16),.Z(C_s[5]));

//Stagen 7
Buffer_Normal U28 (.Gij_in(G[5]),.Pij_in(P[5]),.Gij_out(S17),.Pij_out(S18));
Gray_Odd      U29 (.Gik(S17),.Pik(S18),.Gkj(C_s[5]),.Gij(S19));
INVX          U30 (.A(S19),.Z(C_s[6]));

//Stage 8
Black_Odd  U31 (.Gik(G[6]),.Pik(P[6]),.Gkj(G[5]),.Pkj(P[5]),.Gij(S20),.Pij(S21));
Black_Even U32 (.Gik(S20),.Pik(S21),.Gkj(S12),.Pkj(S13),.Gij(S22),.Pij(S23));
Gray_Odd   U33 (.Gik(S22),.Pik(S23),.Gkj(S7),.Gij(S24));
INVX       U34 (.A(S24),.Z(C_s[7]));

//Stage 9
Buffer_Normal U35 (.Gij_in(G[7]),.Pij_in(P[7]),.Gij_out(S25),.Pij_out(S26));
Gray_Odd      U36 (.Gik(S25),.Pik(S26),.Gkj(C_s[7]),.Gij(S27));
INVX          U37 (.A(S27),.Z(C_s[8]));

//Stage 10
Black_Odd     U38 (.Gik(G[8]),.Pik(P[8]),.Gkj(G[7]),.Pkj(P[7]),.Gij(S28),.Pij(S29));
Black_Even    U39 (.Gik(S28),.Pik(S29),.Gkj(S20),.Pkj(S21),.Gij(S30),.Pij(S31));
Black_Odd     U40 (.Gik(S30),.Pik(S31),.Gkj(S14),.Pkj(S15),.Gij(S32),.Pij(S33));
Gray_Even     U41 (.Gik(S32),.Pik(S33),.Gkj(S1),.Gij(S34));
Buffer_Single U42 (.Gij_in(S34),.Gij_out(C_s[9]));

//Stage 11
Buffer_Normal U43 (.Gij_in(G[9]),.Pij_in(P[9]),.Gij_out(S35),.Pij_out(S36));
Gray_Odd      U44 (.Gik(S35),.Pik(S36),.Gkj(S34),.Gij(S37));
INVX          U45 (.A(S37),.Z(C_s[10]));

//Stage 12
Black_Odd     U46 (.Gik(G[10]),.Pik(P[10]),.Gkj(G[9]),.Pkj(P[9]),.Gij(S38),.Pij(S39));
Black_Even    U47 (.Gik(S38),.Pik(S39),.Gkj(S28),.Pkj(S29),.Gij(S40),.Pij(S41));
Black_Odd     U48 (.Gik(S40),.Pik(S41),.Gkj(S22),.Pkj(S23),.Gij(S42),.Pij(S43));
Gray_Even     U49 (.Gik(S42),.Pik(S43),.Gkj(S8),.Gij(S44));
Buffer_Single U50 (.Gij_in(S44),.Gij_out(C_s[11]));

//Stage 13
Buffer_Normal U51 (.Gij_in(G[11]),.Pij_in(P[11]),.Gij_out(S45),.Pij_out(S46));
Gray_Odd      U52 (.Gik(S45),.Pik(S46),.Gkj(S44),.Gij(S47));
INVX          U53 (.A(S47),.Z(C_s[12]));

//Stage 14
Black_Odd     U54 (.Gik(G[12]),.Pik(P[12]),.Gkj(G[11]),.Pkj(P[11]),.Gij(S48),.Pij(S49));
Black_Even    U55 (.Gik(S48),.Pik(S49),.Gkj(S38),.Pkj(S39),.Gij(S50),.Pij(S51));
Black_Odd     U56 (.Gik(S50),.Pik(S51),.Gkj(S30),.Pkj(S31),.Gij(S52),.Pij(S53));
Gray_Even     U57 (.Gik(S52),.Pik(S53),.Gkj(S16),.Gij(S54));
Buffer_Single U58 (.Gij_in(S54),.Gij_out(C_s[13]));

//Stage 15
Buffer_Normal U59 (.Gij_in(G[13]),.Pij_in(P[13]),.Gij_out(S55),.Pij_out(S56));
Gray_Odd      U60 (.Gik(S55),.Pik(S56),.Gkj(S54),.Gij(S57));
INVX          U61 (.A(S57),.Z(C_s[14]));

//Stage 16
Black_Odd     U62 (.Gik(G[14]),.Pik(P[14]),.Gkj(G[13]),.Pkj(P[13]),.Gij(S58),.Pij(S59));
Black_Even    U63 (.Gik(S58),.Pik(S59),.Gkj(S48),.Pkj(S49),.Gij(S60),.Pij(S61));
Black_Odd     U64 (.Gik(S60),.Pik(S61),.Gkj(S40),.Pkj(S41),.Gij(S62),.Pij(S63));
Gray_Even     U65 (.Gik(S62),.Pik(S63),.Gkj(S21),.Gij(S64));
Buffer_Single U66 (.Gij_in(S64),.Gij_out(C_s[15]));

assign C = C_s;

endmodule

//Sum_Logic
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

//COMPONENTES

module HA (A,B,P,G);
input  A,B;
output P,G;

assign P = A ^ B;
assign G = A & B;
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

module Buffer_Single (Gij_in,Gij_out);
input  Gij_in;
output Gij_out;

assign Gij_out = Gij_in;

endmodule

module XOR (C,P,S);
input  C,P;
output S;

assign S = P ^ C;
endmodule

module INVX (A,Z);
input  A;
output Z;

assign Z = ~A;
endmodule