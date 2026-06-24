//Compound gates TestBentch
`timescale 1ns/1ns
`include "Compound_gates1_MDECI.v" //Importamos el archivo al cual le hacemos su testbench

module Compound_gates1_tb();

reg  A,B,C,D; //Creamos registros a nuestras entradas
wire Y_a,Y_b,Y_c,Y_d;   //CReamos cables para nuestras salidas

Compound_gates1 uut(A,B,C,D,Y_a,Y_b,Y_c,Y_d); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("Compound_gates1_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Compound_gates1_tb);
    
    // Test all combinations of A, B, C, D
    //#1
    A = 0;
    B = 0;
    C = 0;
    D = 0;
    #10;    //Espera 10nS entre cambios
    //#2
    A = 1;
    B = 0;
    C = 0;
    D = 0;
    #10;    //Espera 10nS entre cambios
    A = 0;
    B = 1; 
    C = 0;
    D = 0;
    #10;    //Espera 10nS entre cambios
    A = 1;
    B = 1;
    C = 0;
    D = 0;
    #10;    //Espera 10nS entre cambios
    A = 0;
    B = 0;
    C = 1;
    D = 0;
    #10;    //Espera 10nS entre cambios
    A = 1;
    B = 0;
    C = 1;
    D = 0;
    #10;    //Espera 10nS entre cambios
    A = 0;
    B = 1;
    C = 1;
    D = 0;
    #10;    //Espera 10nS entre cambios
    A = 1;
    B = 1;
    C = 1;
    D = 0;
    #10;    //Espera 10nS entre cambios
    A = 0;
    B = 0;
    C = 0;
    D = 1;
    #10;    //Espera 10nS entre cambios
    A = 1;
    B = 0;
    C = 0;
    D = 1;
    #10;    //Espera 10nS entre cambios
    A = 0;
    B = 1;
    C = 0;
    D = 1;
    #10;    //Espera 10nS entre cambios
    A = 1;
    B = 1;
    C = 0;
    D = 1;
    #10;    //Espera 10nS entre cambios
    A = 0;
    B = 0;
    C = 1;
    D = 1;
    #10;    //Espera 10nS entre cambios
    A = 1;
    B = 0;
    C = 1;
    D = 1;
    #10;    //Espera 10nS entre cambios
    A = 0;
    B = 1;
    C = 1;
    D = 1;
    #10;    //Espera 10nS entre cambios
    A = 1;
    B = 1;
    C = 1;
    D = 1;
    #10;    //Espera 10nS entre cambios


    $display("Test completed");

end

endmodule
