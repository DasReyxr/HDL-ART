//Compound gates TestBentch
`timescale 1ns/1ns
`include "CodeGray_KMC.v" //Importamos el archivo al cual le hacemos su testbench

module CodeGray_KMC_tb();

reg [2:0] Q;       //Creamos registros a nuestras entradas
wire [2:0] Qn_POS; //CReamos cables para nuestras salidas
wire [2:0] Qn_SOP; 


CodeGray_KMC uut (Q, Qn_POS, Qn_SOP); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $dumpfile("CodeGray_KMC_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,CodeGray_KMC_tb);
    
    // Test all combinations of Q2, Q1, Q0
    //#1
    Q = 3'b000; #10; //Espera 10nS entre cambios
    //#2
    Q = 3'b001; #10;    //Espera 10nS entre cambios
    //#3
    Q = 3'b010; #10;    //Espera 10nS
    //#4
    Q = 3'b011; #10;    //Espera 10nS entre cambios
    //#5
    Q = 3'b100; #10;    //Espera 10nS
    //#6
    Q = 3'b101; #10;    //Espera 10nS entre cambios
    //#7
    Q = 3'b110; #10;    //Espera 10nS
    //#8
    Q = 3'b111;
    #10;    //Espera 10nS entre cambios
    


    $display("Test completed");

end

endmodule