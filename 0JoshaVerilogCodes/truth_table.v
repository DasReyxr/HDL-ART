module truth_table (A,B,Z_AI,Z_JM);

input A,B; //2 bits selector
output Z_AI,Z_JM; //Output
wire [1:0] S; //2 bits wire to connect to the selector

assign S[0] = A;
assign S[1] = B;
 
assign Z_AI = (S == 2'b00) ? 1'b0 : //If S is 00, Z is 0
              (S == 2'b01) ? 1'b1 : //If S is 01, Z is 1
              (S == 2'b10) ? 1'b1 : //If S is 10, Z is 1
                             1'b0 ; //If S is 11, Z is 0

assign Z_JM = S[1] ? (S[0] ? 1'b0 : 1'b1) : //If S[1] is 1, and S[0] is 1, Z is 0, if S[0] is 0, Z is 1
                     (S[0] ? 1'b1 : 1'b0) ; //If S[1] is 0, and S[0] is 1, Z is 1, if S[0] is 0, Z is 0
        
endmodule
