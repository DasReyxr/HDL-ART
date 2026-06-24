//FULL ADDER 8b+8b TestBench
`timescale 1ns/1ns
`include "FAdder8b.v" //Importamos el archivo al cual le hacemos su testbench

module FA_8b_tb ();

reg [7:0] AM,BM,CinM;
wire[8:0] Result;
wire[7:0] COS,SM;

FA_8b uut(AM,BM,Result,CinM);

initial begin

    $dumpfile("FAdder8b_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,FA_8b_tb);
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