//CARRY SKIP 8b+8b TestBench
`timescale 1ns/1ns
`include "Circuit_b.v" //Importamos el archivo al cual le hacemos su testbench

module Cb_tb ();
reg A,B,C,D;
wire b,b2,b3;

circuit_b uut (A,B,C,D,b,b2,b3);

initial begin

    $dumpfile("Circuitb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Cb_tb);
    $display("A");
    A = 0;
    B = 0;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("B");
    A = 0;
    B = 0;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("C");
    A = 0;
    B = 1;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("D");
    A = 0;
    B = 1;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("E");
    A = 1;
    B = 0;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("F");
    A = 1;
    B = 0;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("G");
    A = 1;
    B = 1;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("H");
    A = 1;
    B = 1;
    D = 1;
    #20;    //Espera 20nS entre cambios
    
    $display("Test completed");

end

endmodule