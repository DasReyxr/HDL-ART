module FA_8b (AM,BM,Result,CinM);

input [7:0] AM,BM,CinM;
output[8:0] Result;
wire  [8:0] SM;
wire  [7:0] COS;

FA U0(.A(AM[0]),.B(BM[0]),.Cin(1'b0)  ,.S(SM[0]),.Cout(COS[0]));
FA U1(.A(AM[1]),.B(BM[1]),.Cin(COS[0]),.S(SM[1]),.Cout(COS[1]));
FA U2(.A(AM[2]),.B(BM[2]),.Cin(COS[1]),.S(SM[2]),.Cout(COS[2]));
FA U3(.A(AM[3]),.B(BM[3]),.Cin(COS[2]),.S(SM[3]),.Cout(COS[3]));
FA U4(.A(AM[4]),.B(BM[4]),.Cin(COS[3]),.S(SM[4]),.Cout(COS[4]));
FA U5(.A(AM[5]),.B(BM[5]),.Cin(COS[4]),.S(SM[5]),.Cout(COS[5]));
FA U6(.A(AM[6]),.B(BM[6]),.Cin(COS[5]),.S(SM[6]),.Cout(COS[6]));
FA U7(.A(AM[7]),.B(BM[7]),.Cin(COS[6]),.S(SM[7]),.Cout(SM[8]));

assign Result = SM;

endmodule

module FA (A,B,S,Cin,Cout);

    input A,B,Cin;
    output S,Cout;

    assign S = (A ^ B) ^ Cin;
    assign Cout = (A & B) | ((A ^ B) & Cin);

endmodule
