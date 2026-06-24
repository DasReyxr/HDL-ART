//COMPLEMENTO A 2TestBench
`timescale 1ns/1ns
`include "C_A2.v" //Importamos el archivo al cual le hacemos su testbench

module C_A2_tb ();

    reg  [7:0] IN;
    wire [8:0] A_2;
    wire [7:0] A_1, C_S;

CA2 uut(IN, A_2);

initial begin

    $dumpfile("C_A2_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,C_A2_tb);
    $display("A");
    IN = 8'b10100110;
    #20;    //Espera 20nS entre cambios
    $display("C");
    IN = 8'b00110011;
    #20;    //Espera 20nS entre cambios
    $display("D");
    IN = 8'b11111010;
    #20;    //Espera 20nS entre cambios
    $display("E");
    IN = 8'b00000000;
    #10;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule