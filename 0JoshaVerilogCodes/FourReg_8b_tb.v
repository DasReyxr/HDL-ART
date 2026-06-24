//Four registers with 8-bit width, write enable and reset testbench
`timescale 1ns/1ps
`include "FourReg_8b.v" //Import the file to which we are making its testbench

module FourReg_8b_tb ();
reg clk, rst_n, en_write; //Inputs
reg [1:0] addr; //Inputs
reg [7:0] write_data; //Inputs
wire [7:0] out_0, out_1, out_2, out_3; //Outputs

//Instantiate the module under test
FourReg_8b uut (clk, rst_n, en_write, addr, write_data, out_0, out_1, out_2, out_3);
initial begin
    $dumpfile("FourReg_8b_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,FourReg_8b_tb);     //Record all variable changes in the testbench

    // Test sequence
    rst_n = 0; en_write = 0; addr = 2'b00; write_data = 8'h04; clk = 0;
    #10
    clk = 1; // Rising edge, registers should reset to 0
    #10;
    
    rst_n = 1; en_write = 1; addr = 2'b00; write_data = 8'h04; clk = 0;
    #10
    clk = 1; // Rising edge, out_0 should capture write_data
    #10;

    rst_n = 1; en_write = 1; addr = 2'b01; write_data = 8'h0A; clk = 0;
    #10
    clk = 1; // Rising edge, out_1 should capture write_data
    #10;

    rst_n = 1; en_write = 1; addr = 2'b10; write_data = 8'h0F; clk = 0;
    #10
    clk = 1; // Rising edge, out_2 should capture write_data
    #10;

    rst_n = 1; en_write = 1; addr = 2'b00; write_data = 8'h11; clk = 0;
    #10
    clk = 1; // Rising edge, out_0 should capture write_data
    #10;

    rst_n = 1; en_write = 1; addr = 2'b11; write_data = 8'h4A; clk = 0;
    #10
    clk = 1; // Rising edge, out_3 should capture write_data
    #10;

    rst_n = 0; en_write = 0; addr = 2'b00; write_data = 8'h00; clk = 0;
    #10
    clk = 1; // Rising edge, registers should reset to 0
    #10;

    $display("Test completed"); //Show message in console when test is completed   
end
endmodule
