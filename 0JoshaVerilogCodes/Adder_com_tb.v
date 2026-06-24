//Adder components test bench TestBentch
`timescale 1ns/1ns
`include "Adder_com.v" //Importamos el archivo al cual le hacemos su testbench

module Adder_com_tb();

reg  HA_A, HA_B;
wire HA_P, HA_G;

reg  X_C, X_P;
wire X_S;

reg  Gik_main, Pik_main, Gkj_main, Pkj_main;
wire BC_N_G, BC_N_P, BC_E_G, BC_E_P, BC_O_G, BC_O_P;
wire GC_N_G, GC_E_G, GC_O_G;
wire B_N_G, B_N_P,  B_OE_G,B_OE_P;

Adder_com uut (HA_A, HA_B, HA_P, HA_G,
X_C, X_P, X_S,
Gik_main, Pik_main, Gkj_main, Pkj_main,
BC_N_G, BC_N_P, BC_E_G, BC_E_P, BC_O_G, BC_O_P,
GC_N_G, GC_E_G, GC_O_G, 
B_N_G, B_N_P, B_OE_G, B_OE_P);

initial begin
    $dumpfile("Adder_com_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Adder_com_tb);

    $display("A");

    Gik_main = 0; 
    Pik_main = 0; 
    Gkj_main = 0;
    Pkj_main = 0;

    X_C = 0; 
    X_P = 0;

    HA_A = 0;
    HA_B = 0;

    #20;    //Espera 20nS entre cambios

    $display("B");

    HA_A = 1;
    HA_B = 0;

    #20;    //Espera 20nS entre cambios

    $display("C");
    
    HA_A = 0;
    HA_B = 1;

    #20;    //Espera 20nS entre cambios

    $display("D");

    HA_A = 1;
    HA_B = 1;

    #20;    //Espera 20nS entre cambios

    $display("E");

    HA_A = 0;
    HA_B = 0;

    X_C = 0; 
    X_P = 0;

    #20;    //Espera 20nS entre cambios

    $display("F");

    X_C = 1; 
    X_P = 0;

    #20;    //Espera 20nS entre cambios

    $display("G");

    X_C = 0; 
    X_P = 1;

    #20;    //Espera 20nS entre cambios

    $display("H");

    X_C = 1; 
    X_P = 1;

    #20;    //Espera 20nS entre cambios

    $display("I");

    X_C = 0; 
    X_P = 0;

    Gik_main = 0; 
    Pik_main = 0; 
    Gkj_main = 0;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("J");

    Gik_main = 1; 
    Pik_main = 0; 
    Gkj_main = 0;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("K");

    Gik_main = 0; 
    Pik_main = 1; 
    Gkj_main = 0;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("L");

    Gik_main = 1; 
    Pik_main = 1; 
    Gkj_main = 0;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("M");

    Gik_main = 0; 
    Pik_main = 0; 
    Gkj_main = 1;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("N");

    Gik_main = 1; 
    Pik_main = 0; 
    Gkj_main = 1;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("O");

    Gik_main = 0; 
    Pik_main = 1; 
    Gkj_main = 1;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("P");

    Gik_main = 1; 
    Pik_main = 1; 
    Gkj_main = 1;
    Pkj_main = 0;

    #20;    //Espera 20nS entre cambios

    $display("Q");

    Gik_main = 0; 
    Pik_main = 0; 
    Gkj_main = 0;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("R");

    Gik_main = 1; 
    Pik_main = 0; 
    Gkj_main = 0;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("S");

    Gik_main = 0; 
    Pik_main = 1; 
    Gkj_main = 0;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("T");

    Gik_main = 1; 
    Pik_main = 1; 
    Gkj_main = 0;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("U");

    Gik_main = 0; 
    Pik_main = 0; 
    Gkj_main = 1;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("V");

    Gik_main = 1; 
    Pik_main = 0; 
    Gkj_main = 1;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("W");

    Gik_main = 0; 
    Pik_main = 1; 
    Gkj_main = 1;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("X");

    Gik_main = 1; 
    Pik_main = 1; 
    Gkj_main = 1;
    Pkj_main = 1;

    #20;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule