module Compound_gates1 (A,B,C,D,Y_a,Y_b,Y_c,Y_d);
input A,B,C,D;
output Y_a,Y_b,Y_c,Y_d;   

//              _______
// Circuit A -> ABC + D
assign Y_a = ~((A & B & C) | D);

//              _________
// Circuit B -> (AB + C)D
assign Y_b = ~(((A & B) | C) & D);

//              _____________
// Circuit C -> AB + C(A + B)
assign Y_c = ~((A & B) | (C & (A | B)));

//              ________
// Circuit D -> (A + B)C
assign Y_d = ~(((A | B) & C));

endmodule