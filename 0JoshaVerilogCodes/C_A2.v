//////MODULO COMPLEMENTO A 2 APLICADO//////
module CA2 (IN,A_2);

    input [7:0] IN;
    output[8:0] A_2;
    wire  [7:0] A_1;
    wire  [7:0] C_S;

    assign A_1 =  ~IN; //HACEMOS COMPLEMNETO A 1

    HA U0 (.A(A_1[0]),.B(1'b1)  ,.S(A_2[0]),.C(C_S[0]));
    HA U1 (.A(A_1[1]),.B(C_S[0]),.S(A_2[1]),.C(C_S[1]));
    HA U2 (.A(A_1[2]),.B(C_S[1]),.S(A_2[2]),.C(C_S[2]));
    HA U3 (.A(A_1[3]),.B(C_S[2]),.S(A_2[3]),.C(C_S[3]));
    HA U4 (.A(A_1[4]),.B(C_S[3]),.S(A_2[4]),.C(C_S[4]));
    HA U5 (.A(A_1[5]),.B(C_S[4]),.S(A_2[5]),.C(C_S[5]));
    HA U7 (.A(A_1[6]),.B(C_S[5]),.S(A_2[6]),.C(C_S[6]));
    HA U8 (.A(A_1[7]),.B(C_S[6]),.S(A_2[7]),.C(A_2[8]));

endmodule

//////MODULO HALF ADDER APLICADO//////
module HA (A,B,S,C);

    input A,B;
    output S,C;

    assign S = A ^ B; //SUMA CON XOR
    assign C = A & B; //CARRY CON AND

endmodule