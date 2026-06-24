module xor_test(A,B,Y,Y_Gates);

    input A,B;
    output Y,Y_Gates;

    XOR2X1    T0 (.A(A), .B(B), .Y(Y));
    XOR_Gates T1 (.A(A), .B(B), .Y(Y_Gates));

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