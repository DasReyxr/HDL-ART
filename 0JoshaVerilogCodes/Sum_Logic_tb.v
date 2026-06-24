//Adder components test bench TestBentch
`timescale 1ns/1ns
`include "Sum_Logic.v" //Importamos el archivo al cual le hacemos su testbench

module Sum_Logic_tb();

localparam  N = 15 ;
reg  [N:0] C,P;
reg  G;
wire [N:0] S;
wire Cout;
wire [N:0] S_s;
wire CO_s;

Sum_Logic uut (C,P,G,S,Cout);

initial begin

    $dumpfile("Sum_Logic.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Sum_Logic_tb);
    $display("A");
    G = 0;
    C = 16'h0000;
    P = 16'h0000;
    #10;    //Espera 10nS entre cambios
    $display("B");
    G = 1;
    C = 16'h0000;
    P = 16'hFFFF;
    #10;    //Espera 10nS entre cambios
    $display("C");
    G = 0;
    C = 16'hFFFF;
    P = 16'h0000;
    #10;    //Espera 10nS entre cambios
    $display("D");
    G = 1;
    C = 16'hFFFF;
    P = 16'hFFFF;
    #10;    //Espera 10nS entre cambios

    $display("Test completed");

end

endmodule
   