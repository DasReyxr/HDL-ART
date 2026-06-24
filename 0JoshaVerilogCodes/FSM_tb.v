//FSM TEST BENCH
`timescale 1ns/1ns
`include "FSM.v" //Importamos el archivo al cual le hacemos su testbench

module FSM_tb ();

reg Clk;
reg Modo;
wire V_out;
wire A_out; 
wire R_out; 

FSM uut (V_out, A_out, R_out,Clk,Modo);

initial begin

    $dumpfile("FSM_tb.vcd");
    $dumpvars(0,FSM_tb);
    $display("Start");

    Clk = 0;
    Modo = 1;
    #10;
    //Llego a R1
    Clk = 1;
    #10
    Clk = 0;
    #10
    //Regresa a A
    Clk = 1;
    #10
    Clk = 0;
    #10
    //Sigue en A
    Clk = 1;
    #10
    Clk = 0;
    #10
    Modo = 0;
    //R1
    Clk = 1;
    #10
    Clk = 0;
    #10
    //R2
    Clk = 1;
    #10
    Clk = 0;
    #10
    //R3
    Clk = 1;
    #10
    Clk = 0;
    #10
    //R4
    Clk = 1;
    Modo = 1;
    #10
    Clk = 0;
    #10
    //V1
    Clk = 1;
    #10
    Clk = 0;
    #10
    //V2
    Clk = 1;
    #10
    Clk = 0;
    #10
    //V3
    Clk = 1;
    #10
    Clk = 0;
    #10
    //A
    Clk = 1;
    #10
    Clk = 0;
    #10
    Clk = 1;
    #10
    Clk = 0;
    #10
    Clk = 1;
    #10
    Clk = 0;
    #10
    Clk = 1;
    #10
    Clk = 0;
    #10
    Clk = 1;
    #10
    Clk = 0;
    #10
     $display("Test completed");

end

endmodule