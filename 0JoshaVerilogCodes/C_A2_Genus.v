module C_A2_Genus (In,Enable,Out);

    input [3:0] In;
    input Enable;
    output [3:0]Out;
    wire w_0, w_1, w_2, w_3, w_4, w_5, w_6;

    XOR_Gates T0 (.A(Enable), .B(In[0]), .Y(w_0));
    XOR_Gates T1 (.A(Enable), .B(In[1]), .Y(w_1));
    XOR_Gates T2 (.A(Enable), .B(In[2]), .Y(w_2));
    XOR_Gates T3 (.A(Enable), .B(In[3]), .Y(w_3));

    HAX1 T4 (.A(w_0), .B(Enable), .YS(Out[0]), .YC(w_4));
    HAX1 T5 (.A(w_1), .B(w_4), .YS(Out[1]), .YC(w_5));
    HAX1 T6 (.A(w_2), .B(w_5), .YS(Out[2]), .YC(w_6));
    HAX1 T7 (.A(w_3), .B(w_6), .YS(Out[3]), .YC());

endmodule


module HAX1 (A,B,YS,YC);

    input A,B;
    output YS,YC;

    assign YS = A ^ B; //SUMA CON XOR
    assign YC = A & B; //CARRY CON AND

endmodule

module XOR2X1 (A,B,Y);

    input A,B;
    output Y;

    assign Y = A ^ B;

endmodule

module XOR_Gates (A,B,Y);

    input A,B;
    output Y;
    wire net_0,net_1,net_2,net_3,net_4,net_5;

    INVX1   U0 (.A(A), .Y(net_0));
    INVX1   U1 (.A(B), .Y(net_1));

    NAND2X1 U2 (.A(B), .B(net_0), .Y(net_2));
    NAND2X1 U3 (.A(A), .B(net_1), .Y(net_3));

    INVX1   U4 (.A(net_2), .Y(net_4));
    INVX1   U5 (.A(net_3), .Y(net_5));

    OR2X1   U6 (.A(net_4), .B(net_5), .Y(Y));

endmodule

module NAND2X1 (A,B,Y);

    input A,B;
    output Y;

    assign Y = ~(A & B);

endmodule

module OR2X1 (A,B,Y);

    input A,B;
    output Y;

    assign Y = A | B;

endmodule   

module INVX1 (A,Y);

    input A;
    output Y;

    assign Y = ~A;

endmodule