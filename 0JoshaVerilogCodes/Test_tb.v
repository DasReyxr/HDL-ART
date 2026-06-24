//AND gate TestBentch
`timescale 1ns/1ns
`include "Test.v" //Importamos el archivo al cual le hacemos su testbench

module Test_tb();

reg  A,B; //Creamos registros a nuestras entradas
wire Z;   //CReamos cables para nuestras salidas

Test uut(A,B,Z); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("Test_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Test_tb);
    #20
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
