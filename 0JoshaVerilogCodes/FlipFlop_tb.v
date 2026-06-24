//FlipFlop testbench
`timescale 1ns/1ps
`include "FlipFlop.v" //Import the file to which we are making its testbench

module FlipFlop_tb ();
reg clk; //Inputs
reg [3:0]d;  //Inputs
wire [3:0]q; //Output

//Instantiate the module under test
FlipFlop_3 uut (clk,d,q);
initial begin
    $dumpfile("FlipFlop_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,FlipFlop_tb);     //Record all variable changes in the testbench

    // Test sequence
    d = 4'b1010;
    clk = 0;
    #10
    clk = 1; // Rising edge, q should capture d 
    #10; 

    $display("Test completed"); //Show message in console when test is completed   
end
endmodule
