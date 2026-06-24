module CSlim (AF,BF,CF,DF,A,B,C,S0,S1,S2,S3,S4);

    input AF,BF,CF,DF,A,B,C;
    output S0,S1,S2,S3,S4;

    assign S0 = (AF | BF) & (CF | DF);
    assign S1 = (A | (B & C));
    assign S2 = (~A & ~B & ~C); 
    assign S3 = ((~A | ~B) & C);
    assign S4 = ((~A & ~B) | ~C);

endmodule