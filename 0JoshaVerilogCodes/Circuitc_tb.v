//CARRY SKIP 8b+8b TestBench
`timescale 1ns/1ns
`include "Circuit_c.v" //Importamos el archivo al cual le hacemos su testbench

module Cc_tb ();
reg A,B,C,D;
wire c,c2,c3,c4;

circuit_c uut (A,B,C,D,c,c2,c3,c4);

initial begin

    $dumpfile("Circuitc.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Cc_tb);
    $display("A");
    A = 0;
    B = 0;
    C = 0;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("B");
    A = 0;
    B = 0;
    C = 0;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("C");
    A = 0;
    B = 0;
    C = 1;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("D");
    A = 0;
    B = 0;
    C = 1;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("E");
    A = 0;
    B = 1;
    C = 0;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("F");
    A = 0;
    B = 1;
    C = 0;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("G");
    A = 0;
    B = 1;
    C = 1;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("H");
    A = 0;
    B = 1;
    C = 1;
    D = 1;
    #20;    //Espera 20nS entre cambios
    $display("I");
    A = 1;
    B = 0;
    C = 0;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("J");
    A = 1;
    B = 0;
    C = 0;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("K");
    A = 1;
    B = 0;
    C = 1;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("L");
    A = 1;
    B = 0;
    C = 1;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("M");
    A = 1;
    B = 1;
    C = 0;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("N");
    A = 1;
    B = 1;
    C = 0;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("O");
    A = 1;
    B = 1;
    C = 1;
    D = 0;
    #20;    //Espera 20nS entre cambios

    $display("P");
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    #20;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule