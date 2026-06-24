module Full_Adder_generate #(parameter N=4) (AM,BM,CinM,Result,CoutM);

    input [N-1:0] AM,BM;
    input CinM;
    output [N:0] Result;
    output CoutM;
    wire [N:0] CoutS;

    genvar i; //Intern variable

    assign CoutS[0] = CinM;

    generate
        for (i=0; i<N; i=i+1) begin
           FA U0(.A(AM[i]),.B(BM[i]),.Cin(CoutS[i]),.S(Result[i]),.Cout(CoutS[i+1]));
        end
    endgenerate

    assign Result[N] = CoutS[N];

endmodule

//Full Adder Module
module FA (A,B,Cin,S,Cout);

    input  A,B,Cin;
    output S,Cout;

    assign S = ((A ^ B) ^ Cin);
    assign Cout = (((A ^ B) & Cin) | (A & B));

endmodule
