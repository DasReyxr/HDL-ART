//CARRY SKIP 8b+8b TestBench
`timescale 1ns/1ns
`include "CSkip8b.v" //Importamos el archivo al cual le hacemos su testbench

module CS_8b_tb ();

reg [7:0] AM,BM;
wire[8:0] Result;
wire[8:0] SM, COM;

CS8 uut(AM,BM,Result);

initial begin

    $dumpfile("CSkip8b_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,CS_8b_tb);
    $display("A");
    AM = 8'b11101110;
    BM = 8'b10101010;
    #20;    //Espera 20nS entre cambios
    $display("C");
    AM = 8'b00110011;
    BM = 8'b01000100;
    #20;    //Espera 20nS entre cambios
    $display("D");
    AM = 8'b01100110;
    BM = 8'b11011101;
    #20;    //Espera 20nS entre cambios
    $display("E");
    AM = 8'b01000100;
    BM = 8'b10011001;
    #10;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule