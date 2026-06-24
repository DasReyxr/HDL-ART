module circuit_b (A,B,C,D,b,b2,b3);

input A,B,C,D;
output b,b2,b3;

//PRODUCTO DE SUMA
assign b = (D | ~B) & (~D | A | B) & (~A | ~B);
//SUMA DE PRODUCTOS
assign b2 = (~D & ~B) | (D & ~A & B) | (A & ~B);

assign b3 =(D & ~A & ~B) | (B & (A | ~D));



endmodule
