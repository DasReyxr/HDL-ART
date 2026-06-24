//BLACK CELL TestBentch
`timescale 1ns/1ns
`include "BC_Odd.v" //Importamos el archivo al cual le hacemos su testbench

module BC_Odd_tb();

reg  A,B,C; //Creamos registros a nuestras entradas
wire Y,Y_alt,Y_new,Normal,Neg,Pre_neg,Y_alt_2,Pre_neg_try,Neg_try;   //CReamos cables para nuestras salidas
wire S1, P,G,PN,GN,S2;       //Creamos cables para las señales

BC_Odd uut(A,B,C,Y,Y_alt,Y_new,Normal,Neg,Pre_neg,Y_alt_2,Pre_neg_try,Neg_try); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("BC_Odd_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,BC_Odd_tb);

    $display("A");
    A = 0;
    B = 0;
    C = 0;
    #20;    //Espera 20nS entre cambios

    $display("B");
    A = 0;
    B = 0;
    C = 1;
    #20;    //Espera 20nS entre cambios

    $display("C");
    A = 0;
    B = 1;
    C = 0;
    #20;    //Espera 20nS entre cambios

    $display("D");
    A = 0;
    B = 1;
    C = 1;
    #20;    //Espera 20nS entre cambios

    $display("E");
    A = 1;
    B = 0;
    C = 0;
    #20;    //Espera 20nS entre cambios

    $display("F");
    A = 1;
    B = 0;
    C = 1;
    #20;    //Espera 20nS entre cambios

    $display("G");
    A = 1;
    B = 1;
    C = 0;
    #20;    //Espera 20nS entre cambios

    $display("H");
    A = 1;
    B = 1;
    C = 1;
    #20;    //Espera 20nS entre cambios
    
    $display("Test completed");

end

endmodule