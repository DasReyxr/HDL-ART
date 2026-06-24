module VGD (p,q,r,w,x,y,z);
input p,q,r;
output w,x,y,z;

//Caso 1 -> q^r
// & = AND = ^
assign w = (q & r);

//Caso 2 -> p v (q ^ r)
// | = OR = v
assign x = (p | (q & r));

//Caso 3 -> p v q
// | = OR = v
assign y = (p | q);

//Caso 4 -> (p v q) ^ r
assign z = ((p | q) & r);

endmodule
