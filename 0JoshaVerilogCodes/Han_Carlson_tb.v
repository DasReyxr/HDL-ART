//Adder components test bench TestBentch
`timescale 1ns/1ns
`include "Han_Carlson.v" //Importamos el archivo al cual le hacemos su testbench

module Han_Carlson_tb();

reg  [14:0] P,G;
reg  Cin;
wire [15:0] C;

wire [15:0] C_s;
wire S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,
     S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,
     S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,
     S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,
     S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,
     S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,
     S60,S61,S62,S63,S64;

Han_Carlson uut (P,G,Cin,C);

initial begin

    $dumpfile("Han_Carlson_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,Han_Carlson_tb);
    $display("A");
    Cin = 0;
    P = 16'h0000;
    G = 16'h0000;
    #10;    //Espera 10nS entre cambios

    $display("Test completed");

end

endmodule