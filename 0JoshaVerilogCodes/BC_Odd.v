module BC_Odd (A,B,C,Y,Y_alt,Y_new,Normal,Neg,Pre_neg,Y_alt_2,Pre_neg_try,Neg_try);

input A,B,C;
output Y,Y_alt,Y_new,Normal,Neg,Pre_neg,Y_alt_2,Pre_neg_try,Neg_try;
wire S1, P,G,PN,GN,S2;    

assign S1 = A & C;
assign Y = ((~A & ~B) | ~C);
assign Y_alt = ~((A & B) | C);
assign Y_alt_2 = ((A & B) ~| C);
assign Y_new = ((A & B) | C);

//TEST

assign S2 = A ~& C;

assign P = B ^ C;
assign G = B & C;
assign Normal = ((S1 & P) | G);

assign PN = B ~^ C;
assign GN = B ~& C;
assign Neg = ((S2 & PN) ~| GN);
assign Neg_try = ((S1 & P) ~| G);

assign Pre_neg = ((~S2 & ~PN) | ~GN);
assign Pre_neg_try = ((~S1 & ~P) | ~G);

endmodule