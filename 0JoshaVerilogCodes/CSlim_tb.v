//CARLOS SLIM TAREA
`timescale 1ns/1ns
`include "CSlim.v" //Importamos el archivo al cual le hacemos su testbench

module CSlim_tb ();
reg AF,BF,CF,DF,A,B,C;
wire S0,S1,S2,S3,S4;

CSlim uut (AF,BF,CF,DF,A,B,C,S0,S1,S2,S3,S4);

initial begin

$dumpfile("CSlim_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
$dumpvars(0,CSlim_tb);
$display("A");
A = 0;
B = 0;
C = 0;

AF = 0;
BF = 0;
CF = 0;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("B");
A = 0;
B = 0;
C = 1;

AF = 0;
BF = 0;
CF = 0;
DF = 1;

#20;    //Espera 20nS entre cambios

$display("C");
A = 0;
B = 1;
C = 0;

AF = 0;
BF = 0;
CF = 1;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("D");
A = 0;
B = 1;
C = 1;

AF = 0;
BF = 0;
CF = 1;
DF = 1;

#20;    //Espera 20nS entre cambios

$display("E");
A = 1;
B = 0;
C = 0;

AF = 0;
BF = 1;
CF = 0;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("F");
A = 1;
B = 0;
C = 1;

AF = 0;
BF = 1;
CF = 0;
DF = 1;

#20;    //Espera 20nS entre cambios

$display("G");
A = 1;
B = 1;
C = 0;

AF = 0;
BF = 1;
CF = 1;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("H");
A = 1;
B = 1;
C = 1;

AF = 0;
BF = 1;
CF = 1;
DF = 1;

#20;    //Espera 20nS entre cambios

$display("I");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 0;
CF = 0;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("J");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 0;
CF = 0;
DF = 1;

#20;    //Espera 20nS entre cambios

$display("K");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 0;
CF = 1;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("L");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 0;
CF = 1;
DF = 1;

#20;    //Espera 20nS entre cambios

$display("M");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 1;
CF = 0;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("N");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 1;
CF = 0;
DF = 1;

#20;    //Espera 20nS entre cambios

$display("O");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 1;
CF = 1;
DF = 0;

#20;    //Espera 20nS entre cambios

$display("P");
A = 1;
B = 1;
C = 1;

AF = 1;
BF = 1;
CF = 1;
DF = 1;

#20;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule