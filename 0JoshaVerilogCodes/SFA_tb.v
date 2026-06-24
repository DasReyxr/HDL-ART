//FULL ADDER 4b+4b TestBench
`timescale 1ns/1ns
`include "SFA.v" //Importamos el archivo al cual le hacemos su testbench

module SFA_tb ();

reg [3:0] A,B;
wire[4:0] Z,Carry;
wire Carry_Out;

SFA uut(A,B,Z,Carry,Carry_Out); //Creamos el modulo de la intancia del archivo que le haremos su TB

initial begin
    $display("A");
    $dumpfile("SFA_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,SFA_tb);
    $display("A");
    A = 4'b1110;
    B = 4'b1010;
    #20;    //Espera 20nS entre cambios
    $display("C");
    A = 4'b0011;
    B = 4'b0100;
    #20;    //Espera 20nS entre cambios
    $display("D");
    A = 4'b0110;
    B = 4'b1101;
    #20;    //Espera 20nS entre cambios
    $display("E");
    A = 4'b0100;
    B = 4'b1001;
    #10;    //Espera 20nS entre cambios

    $display("Test completed");

end

endmodule
