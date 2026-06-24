//AND gate TestBentch
`timescale 1ns/1ns
`include "exam.v" //Importamos el archivo al cual le hacemos su testbench

module exam_tb();

reg  A,B,C; //Creamos registros a nuestras entradas
wire X,Y,Z;   //CReamos cables para nuestras salidas

exam uut(A,B,C,X,Y,Z); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("exam_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,exam_tb);
    
    A = 0;
    B = 0;
    C = 0;
    #20;    //Espera 20nS entre cambios

    A = 1;
    B = 0;
    C = 0;
    #20;    //Espera 20nS entre cambios

    A = 0;
    B = 1;
    C = 0;
    #20;    //Espera 20nS entre cambios

    A = 1;
    B = 1;
    C = 0;
    #20;    //Espera 20nS entre cambios

    A = 0;
    B = 0;
    C = 1;
    #20;    //Espera 20nS entre cambios

    
    A = 1;
    B = 0;
    C = 1;
    #20;    //Espera 20nS entre cambios

    A = 0;
    B = 1;
    C = 1;
    #20;    //Espera 20nS entre cambios

    A = 1;
    B = 1;
    C = 1;
    #20;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule
