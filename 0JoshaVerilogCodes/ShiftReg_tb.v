//Shift Register testbench
`timescale 1ns/1ps
`include "ShiftReg.v"

module ShiftReg_tb ();
reg clk,rst_n,Enable_A,Enable_B;
reg data; 
wire [7:0] Q; 

//Instantiate the module under test
ShiftReg uut(clk,rst_n,Enable_A,Enable_B,data,Q);
initial begin
    $dumpfile("ShiftReg_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,ShiftReg_tb);     //Record all variable changes in the testbench

    clk = 0; rst_n=0;
    Enable_A = 0; Enable_B = 0;
    data = 0;
    #10
    clk = 1; //Rising edge, should be reset
    #10

    clk = 0; rst_n=1;
    Enable_A = 0; Enable_B = 0;
    data = 0;
    #10
    clk = 1; //Rising edge, no data because enables arent 1
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 0;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 1;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 0;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 1;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 0;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 0;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 1;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 0;
    #10
    clk = 1;
    #10
    
    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 0;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 1;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 0;
    #10
    clk = 1;
    #10

    clk = 0; rst_n=1;
    Enable_A = 1; Enable_B = 1;
    data = 1;
    #10
    clk = 1;
    #10


    $display("Test completed"); //Show message in console when test is completed

end
endmodule



