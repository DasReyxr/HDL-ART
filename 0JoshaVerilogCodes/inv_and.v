module IA (A,B,Z_and,Z_nand,Z_inv,Z_2inv);
    input  A,B;
    output Z_and,Z_nand,Z_inv,Z_2inv;

    assign Z_and  = A & B;
    assign Z_nand = A ~& B;
    assign Z_inv  = (~(A & B));
    assign Z_2inv = (~A & ~B);

endmodule