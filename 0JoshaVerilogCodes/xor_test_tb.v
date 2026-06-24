//XOR gate TestBentch
`timescale 1ns/1ns
`include "xor_test.v" //Importamos el archivo al cual le hacemos su testbench

module xor_test_tb();

reg  A,B; //Creamos registros a nuestras entradas
wire Y,Y_Gates;   //CReamos cables para nuestras salidas

xor_test uut(A,B,Y,Y_Gates);
 //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("xor_test_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,xor_test_tb);
    
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
