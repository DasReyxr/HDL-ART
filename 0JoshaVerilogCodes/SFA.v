module SFA (A,B,Z,Carry,Carry_Out);

        input [3:0]A,B;
        output [4:0] Z,Carry;
        output Carry_Out;
        wire [4:0] CO_S;

        assign Z[0] = (A[0] ^ B[0]) ^ CO_S[0];
        assign Z[1] = (A[1] ^ B[1]) ^ CO_S[1];
        assign Z[2] = (A[2] ^ B[2]) ^ CO_S[2];
        assign Z[3] = (A[3] ^ B[3]) ^ CO_S[3];
        assign Z[4] = CO_S[4];

        assign CO_S[0] = 1'b0;
        assign CO_S[1] = (A[0] & B[0]) | ((A[0] ^ B[0]) & CO_S[0]);
        assign CO_S[2] = (A[1] & B[1]) | ((A[1] ^ B[1]) & CO_S[1]);
        assign CO_S[3] = (A[2] & B[2]) | ((A[2] ^ B[2]) & CO_S[2]);
        assign CO_S[4] = (A[3] & B[3]) | ((A[3] ^ B[3]) & CO_S[3]);
        
        assign Carry = CO_S;

endmodule


 
