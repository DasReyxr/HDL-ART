module Full_Adder_4b (AM,BM,CinM,Result,CoutM);

input [3:0] AM,BM;
input CinM;
output [4:0] Result;
output CoutM;
wire [2:0] CoutS;

FA U0(.A(AM[0]),.B(BM[0]),.Cin(CinM)    ,.S(Result[0]),.Cout(CoutS[0]));
FA U1(.A(AM[1]),.B(BM[1]),.Cin(CoutS[0]),.S(Result[1]),.Cout(CoutS[1]));
FA U2(.A(AM[2]),.B(BM[2]),.Cin(CoutS[1]),.S(Result[2]),.Cout(CoutS[2]));
FA U3(.A(AM[3]),.B(BM[3]),.Cin(CoutS[2]),.S(Result[3]),.Cout(Result[4]));

assign CoutM = Result[4];

endmodule

//Full Adder Module
module FA (A,B,Cin,S,Cout);

    input  A,B,Cin;
    output S,Cout;

    assign S = ((A ^ B) ^ Cin);
    assign Cout = (((A ^ B) & Cin) | (A & B));

endmodule

