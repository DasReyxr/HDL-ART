module circuit_a (A,B,C,D,a,a2,aCad,a2Cad);

input A,B,C,D;
output a,a2,aCad,a2Cad;

//PRODUCTO DE SUMA
assign a = (A | B) & (~A | C);
//SUMA DE PRODUCTOS
assign a2 = (~A & B) | (A & C);

//PRODUCTO DE SUMA CON "NAND Y NOR"
assign aCad = ~((~(A ~| B)) ~& (~(~A ~| C)));
//SUMA DE PRODUCTOS "NAND Y NOR"
assign a2Cad = ~((~(~A ~& B)) ~| (~(A ~& C)));

endmodule