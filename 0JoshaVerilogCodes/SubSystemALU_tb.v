//Sub system ALU testbench
`timescale 1ns/1ps
`include "SubSystemALU.v"

module SubSystemALU_tb ();
reg clk,rst_n; //Inputs
reg [9:0] next_instruction; //Inputs
wire [9:0] next_instruction_signal_visual; //Internal signal
wire [7:0] out_0,out_1,out_2,out_3; //Outputs
wire zero_flag,carry_flag,sign_flag; //Outputs

//Instantiate the module under test
SubSystemALU uut(clk,rst_n,next_instruction,out_0,out_1,out_2,out_3,zero_flag,carry_flag,sign_flag,next_instruction_signal_visual);
initial begin
    $dumpfile("SubSystemALU_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,SubSystemALU_tb);     //Record all variable changes in the testbench

    clk = 0; rst_n = 0; next_instruction = 10'b0000000000; 
    #10
    clk = 1; // Rising edge, registers should reset to 0
    #10;

    clk = 0; rst_n = 1; next_instruction = 10'b0000000100; 
    #10
    clk = 1; // Rising edge, out_0 should capture write_data (4) ------> R = 04 in reg0
    #10;

    clk = 0; rst_n = 1; next_instruction = 10'b0100001010; 
    #10
    clk = 1; // Rising edge, out_1 should capture write_data (10) ------> R = 0A in reg1
    #10;

    clk = 0; rst_n = 1; next_instruction = 10'b1000000110; 
    #10
    clk = 1; // Rising edge, ALU adds out_0(4) + out_1(10) and writes to out_2  ------> R = 0E in reg2
    #10;

    clk = 0; rst_n = 1; next_instruction = 10'b1001011011; 
    #10
    clk = 1; // Rising edge, ALU adds out_2(10) - out_0(14) and writes to out_3   ------> R = FC in reg3/Borrow = 1
    #10;

    clk = 0; rst_n = 1; next_instruction = 10'b1010110001; 
    #10
    clk = 1; // Rising edge, ALU and out_3(FC) - out_0(4) and writes to out_0   ------> R = 4 in reg1
    #10;

    clk =0;
    #10; // Wait 10 time units
    clk =1;
    #10; // Wait 10 time units

    clk =0;
    #10; // Wait 10 time units
    clk =1;
    #10; // Wait 10 time units

    clk =0;
    #10; // Wait 10 time units
    clk =1;
    #10; // Wait 10 time units

    clk = 0; rst_n = 0; next_instruction = 10'b1001110011; 
    #10
    clk = 1; // Rising edge, registers should reset to 0
    #10;

    clk =0;
    #10; // Wait 10 time units
    clk =1;
    #10; // Wait 10 time units


clk =0;
    #10; // Wait 10 time units
    clk =1;
    #10; // Wait 10 time units

    
    $display("Test completed"); //Show message in console when test is completed
end
endmodule

    