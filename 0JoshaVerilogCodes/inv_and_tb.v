//AND gate TestBentch
`timescale 1ns/1ns
`include "inv_and.v" //Importamos el archivo al cual le hacemos su testbench

module inv_and_tb();

reg  A,B; //Creamos registros a nuestras entradas
wire Z_and,Z_nand,Z_inv,Z_2inv;   //CReamos cables para nuestras salidas

IA uut(A,B,Z_and,Z_nand,Z_inv,Z_2inv); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("inv_and_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,inv_and_tb);

    A = 0;
    B = 0;
    #20;    //Espera 20nS entre cambios

    A = 1;
    B = 0;
    #20;    //Espera 20nS entre cambios

    A = 0;
    B = 1;
    #20;    //Espera 20nS entre cambios

    A = 1;
    B = 1;
    #20;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule
