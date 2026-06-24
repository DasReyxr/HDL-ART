//Adder components test bench TestBentch
`timescale 1ns/1ns
`include "ALU.v" //Importamos el archivo al cual le hacemos su testbench

module ALU_tb ();

reg  [15:0] A,B;
reg  Cin;
reg  [1:0]Sel;
wire [16:0]Out;

wire [15:0] S;
wire [15:0] Out_CA2;
wire [16:0]Sum;
wire Cout;
wire Carry2HC;
wire [15:0] G_signal,P_signal,C2SL;
wire [14:0] G_Aux,P_Aux;
wire MSB_G;
wire [15:0]Out_s;
wire CA2;

ALU uut (A,B,Sel,Out,Cin);

initial begin

    $dumpfile("ALU_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,ALU_tb);
    $display("A");
    Cin = 0;
    Sel = 2'b00;
    A = 16'h0AB4;
    B = 16'h5544;
    #10;    //Espera 10nS entre cambios

    $display("B");
    Cin = 0;
    Sel = 2'b01;
    A = 16'h0AB4;
    B = 16'h5544;
    #10;    //Espera 10nS entre cambios

    $display("C");
    Cin = 0;
    Sel = 2'b10;
    A = 16'h0AB4;
    B = 16'h5544;
    #10;    //Espera 10nS entre cambios

    $display("D");
    Cin = 0;
    Sel = 2'b11;
    A = 16'h0AB4;
    B = 16'h5544;
    #10;    //Espera 10nS entre cambios

    $display("E");
    Cin = 0;
    Sel = 2'b00;
    A = 16'h0000;
    B = 16'h0000;
    #10;    //Espera 10nS entre cambios

    $display("F");
    Cin = 0;
    Sel = 2'b01;
    A = 16'h0000;
    B = 16'h0000;
    #10;    //Espera 10nS entre cambios

    $display("G");
    Cin = 0;
    Sel = 2'b10;
    A = 16'h0000;
    B = 16'h0000;
    #10;    //Espera 10nS entre cambios

    $display("H");
    Cin = 0;
    Sel = 2'b11;
    A = 16'h0000;
    B = 16'h0000;
    #10;    //Espera 10nS entre cambios

    $display("I");
    Cin = 0;
    Sel = 2'b00;
    A = 16'hFFFF;
    B = 16'hFFFF;
    #10;    //Espera 10nS entre cambios

    $display("J");
    Cin = 0;
    Sel = 2'b01;
    A = 16'hFFFF;
    B = 16'hFFFF;
    #10;    //Espera 10nS entre cambios

    $display("K");
    Cin = 0;
    Sel = 2'b10;
    A = 16'hFFFF;
    B = 16'hFFFF;
    #10;    //Espera 10nS entre cambios

    $display("L");
    Cin = 0;
    Sel = 2'b11;
    A = 16'hFFFF;
    B = 16'hFFFF;
    #10;    //Espera 10nS entre cambios

    $display("M");
    Cin = 0;
    Sel = 2'b00;
    A = 16'hFAC2;
    B = 16'hFAC2;
    #10;    //Espera 10nS entre cambios

    $display("N");
    Cin = 0;
    Sel = 2'b01;
    A = 16'hFAC2;
    B = 16'hFAC2;
    #10;    //Espera 10nS entre cambios

    $display("O");
    Cin = 0;
    Sel = 2'b10;
    A = 16'hFAC2;
    B = 16'hFAC2;
    #10;    //Espera 10nS entre cambios

    $display("P");
    Cin = 0;
    Sel = 2'b11;
    A = 16'hFAC2;
    B = 16'hFAC2;
    #10;    //Espera 10nS entre cambios

    $display("Test completed");

end

endmodule