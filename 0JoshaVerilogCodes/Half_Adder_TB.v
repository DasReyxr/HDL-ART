//Half Adder TestBentch
`timescale 1ns/1ns
`include "Half_Adder.v" //Importamos el archivo al cual le hacemos su testbench

module Half_Adder_tb();

reg  A,B; //Creamos registros a nuestras entradas
wire Sum; //Creamos cables para nuestras salidas
wire Carry;

Half_Adder uut (A,B,Sum,Carry); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("Half_Adder_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Half_Adder_tb);

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
