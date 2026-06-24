//Verilog HDL for "Verilog", "Half_Adder" "functional"

module Half_Adder (A,B,Sum,Carry);

    input  A,B;
    output Sum,Carry;

    assign Sum = A ^ B;
    assign Carry = A & B;

endmodule
