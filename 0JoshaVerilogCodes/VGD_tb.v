//Compound gates TestBentch
`timescale 1ns/1ns
`include "VGD.v" //Importamos el archivo al cual le hacemos su testbench

module VGD_tb();

reg  p,q,r; //Creamos registros a nuestras entradas
wire w,x,y,z;   //CReamos cables para nuestras salidas

VGD uut(p,q,r,w,x,y,z); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("VGD_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,VGD_tb);
    
    // Test all combinations of p,q,r
    //#1
    r = 1;
    q = 1;
    p = 1;
    #10;    //Espera 10nS entre cambios
    //#2
    r = 0;
    q = 1;
    p = 1;
    #10;    //Espera 10nS entre cambios
    r = 1;
    q = 0;
    p = 1;
    #10;    //Espera 10nS entre cambios
    r = 0;
    q = 0;
    p = 1;
    #10;    //Espera 10nS entre cambios
    r = 1;
    q = 1;
    p = 0;
    #10;    //Espera 10nS entre cambios
    r = 0;
    q = 1;
    p = 0;
    #10;    //Espera 10nS entre cambios
    r = 1;
    q = 0;
    p = 0;
    #10;    //Espera 10nS entre cambios
    r = 0;
    q = 0;
    p = 0;
    #10;    //Espera 10nS entre cambios
    
    

    $display("Test completed");

end

endmodule
