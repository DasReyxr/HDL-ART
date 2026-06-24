//Adder components test bench TestBentch
`timescale 1ns/1ns
`include "Bit_Wise.v" //Importamos el archivo al cual le hacemos su testbench

module Bit_Wise_tb();

localparam  N = 15 ;
reg  [N:0] A,B;
reg  Cin;
wire [N:0] G,P;
wire Cin_O;
wire [N:0] G_s,P_s;

Bit_Wise uut (A,B,Cin,G,P,Cin_O);

initial begin

    $dumpfile("Bit_Wise_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Bit_Wise_tb);
    $display("A");
    Cin = 0;
    A = 16'h0000;
    B = 16'h0000;
    #10;    //Espera 10nS entre cambios
    $display("B");
    Cin = 1;
    A = 16'h0000;
    B = 16'hFFFF;
    #10;    //Espera 10nS entre cambios
    $display("C");
    Cin = 0;
    A = 16'hFFFF;
    B = 16'h0000;
    #10;    //Espera 10nS entre cambios
    $display("D");
    Cin = 1;
    A = 16'hFFFF;
    B = 16'hFFFF;
    #10;    //Espera 10nS entre cambios

    $display("Test completed");

end

endmodule
   
