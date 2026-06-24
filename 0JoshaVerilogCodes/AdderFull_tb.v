//Adder components test bench TestBentch
`timescale 1ns/1ns
`include "AdderFull.v" //Importamos el archivo al cual le hacemos su testbench

module AdderFull_tb ();

reg  [15:0] A,B;
reg  Cin;
wire [15:0] S;
wire [16:0]Sum;
wire Cout;

wire Carry2HC;
wire [15:0] G_signal,P_signal,C2SL;
wire [14:0] G_Aux,P_Aux;
wire MSB_G,MSB_P;

AdderFull uut (A,B,Cin,S,Cout,Sum);

initial begin

    $dumpfile("AdderFull_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,AdderFull_tb);
    $display("A");
    Cin = 0;
    A = 16'h0000;
    B = 16'h0000;
    #10;    //Espera 10nS entre cambios

    $display("B");
    Cin = 0;
    A = 16'h0AB4;
    B = 16'h5544;
    #10;    //Espera 10nS entre cambios

    $display("C");
    Cin = 0;
    A = 16'hFEA5;
    B = 16'h678A;
    #10;    //Espera 10nS entre cambios

    $display("D");
    Cin = 0;
    A = 16'hFFFF;
    B = 16'hFFFF;
    #10;    //Espera 10nS entre cambios

    $display("Test completed");

end

endmodule