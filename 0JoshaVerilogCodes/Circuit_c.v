module circuit_c (A,B,C,D,c,c2,c3,c4);

input A,B,C,D;
output c,c2,c3,c4;

//PRODUCTO DE SUMA
assign c = (B | C | D) & (~B | C | ~D) & (B | ~C | ~D) & (~B | ~C | D);
//SUMA DE PRODUCTOS
assign c2 = (B & ~C & ~D) | (~B & ~C & D) | (B & C & D) | (~B & C & ~D);
//PRODUCTO DE SUMA FACTORIZADO
assign c3 = ((~B & (~C & ~D | C & D)) | (B & (~C & D | C & ~D)));
//SUMA DE PRODUCTOS FACTORIZADO
assign c4 = ((B & (~C & ~D | C & D)) | (~B & (~C & D | C & ~D)));

endmodule




