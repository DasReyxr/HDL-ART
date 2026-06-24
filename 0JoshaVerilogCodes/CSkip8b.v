//////MODULO CARRY-SKIP APLICADO//////
module CS8 (AM,BM,Result);

input [7:0] AM,BM;
output[8:0] Result;
wire  [8:0] SM;
wire  COM;

CS4 U4 (.ACS(AM[3:0]),.BCS(BM[3:0]),.CICS(1'b0),.SCS(SM[3:0]),.CS(COM));
CS4 U5 (.ACS(AM[7:4]),.BCS(BM[7:4]),.CICS(COM) ,.SCS(SM[7:4]),.CS(SM[8]));

assign Result = SM;

endmodule

//////MODULO CARRY-SKIP 4bits//////
module CS4 (ACS,BCS,CICS,SCS,CS);

input [3:0] ACS,BCS;
input CICS;
output[3:0] SCS;
output CS;
wire  [3:0] COCS,O2A,A2O;

FA U0(.A(ACS[0]),.B(BCS[0]),.Cin(CICS)   ,.S(SCS[0]),.Cout(COCS[0]));
FA U1(.A(ACS[1]),.B(BCS[1]),.Cin(COCS[0]),.S(SCS[1]),.Cout(COCS[1]));
FA U2(.A(ACS[2]),.B(BCS[2]),.Cin(COCS[1]),.S(SCS[2]),.Cout(COCS[2]));
FA U3(.A(ACS[3]),.B(BCS[3]),.Cin(COCS[2]),.S(SCS[3]),.Cout(COCS[3]));

assign O2A[0] = ACS[0] | BCS[0];
assign O2A[1] = ACS[1] | BCS[1];
assign O2A[2] = ACS[2] | BCS[2];
assign O2A[3] = ACS[3] | BCS[3];

assign A2O = O2A[0] & O2A[1] & O2A[2] & O2A[3];

assign CS = COCS[3];

endmodule

//////MODULO FULL-ADDER//////
module FA (A,B,S,Cin,Cout);

    input A,B,Cin;
    output S,Cout;

    assign S = (A ^ B) ^ Cin;
    assign Cout = (A & B) | ((A ^ B) & Cin);
    assign O = A | B;

endmodule
