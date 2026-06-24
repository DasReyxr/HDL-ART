// 4bit counter testbench
`timescale 1ns/1ps
`include "Counter_4b.v"

module Counter_4b_tb ();
reg clk,rst_n; //Inputs
wire [3:0] count; //Outputs
wire MED; //Outputs

//Instantiate the module under test
Counter_4b uut(clk,rst_n,count,MED);
initial begin
    $dumpfile("Counter_4b_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,Counter_4b_tb);     //Record all variable changes in the testbench

    clk = 0; rst_n = 0; 
    #10
    clk = 1; // Rising edge, counter should reset to 0
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 1
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 2
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 3
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 4
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 5
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 6
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 7 and MED should go high
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 8 and MED should go low
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 9
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 10
    #10;

    clk = 0; rst_n = 1; 
    #10
    clk = 1; // Rising edge, counter should increment to 11
    #10;

    clk = 0; rst_n = 1;
    #10
    clk = 1; // Rising edge, counter should increment to 12
    #10;

    clk = 0; rst_n = 1;
    #10
    clk = 1; // Rising edge, counter should increment to 13
    #10;

    clk = 0; rst_n = 1;
    #10
    clk = 1; // Rising edge, counter should increment to 14
    #10;

    clk = 0; rst_n = 1;
    #10
    clk = 1; // Rising edge, counter should increment to 15
    #10;

    clk = 0; rst_n = 1;
    #10
    clk = 1; // Rising edge, counter should roll over to 0
    #10;

    clk = 0; rst_n = 1;
    #10
    clk = 1; // Rising edge, counter should increment to 1
    #10;

    clk = 0; rst_n = 0;
    #10
    clk = 1; // Rising edge, counter should reset to 0
    #10;
    $display("Test completed"); //Show message in console when test is completed
end
endmodule
