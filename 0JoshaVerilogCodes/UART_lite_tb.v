//UART Lite Testbench
`timescale 1ns/1ps
`include "UART_lite.v"

module UART_lite_tb();
reg clk, rst_n; //Inputs
reg rx_serial; //Input serial data
wire [7:0] rx_data; //8-bit output data
wire rx_valid; //Data valid flag
wire err_frame; //Framing error flag

parameter BIT_PERIOD = 16;  // Period in clock cycles
parameter CLK_PERIOD = 2;   

//Instantiate the module under test
UART_lite uut (clk,rst_n,rx_serial,rx_data,rx_valid,err_frame);

initial begin //Generate clock
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;  
end

initial begin
    $dumpfile("UART_lite_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0, UART_lite_tb); //Record all variable changes in the testbench

    //repeat (n) @(posedge clk); Sinatx for waiting n clock cycles 

    rst_n = 0;
    #10;
    rst_n = 1;
    //Example of class rx_valid = 1 / rx_data = 0x19
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Idle
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Idle before start bit
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Start bit
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 0
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 1
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 2
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 3
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 4
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 5
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 6
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 7
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Stop bit

    rst_n = 0;
    #10;
    rst_n = 1;
    //Case 1 rx_valid = 1 / rx_data = 0xA5
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Idle
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Idle before start bit
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Start bit
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 0
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 1
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 2
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 3
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 4
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 5
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 6
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 7
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Stop bit

    rst_n = 0;
    #10;
    rst_n = 1;
    //Case 1 rx_valid = 1 / rx_data = 0x00
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Idle
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Idle before start bit
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Start bit
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 0
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 1
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 2
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 3
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 4
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 5
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 6
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 7
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Stop bit

rst_n = 0;
    #10;
    rst_n = 1;
    //Case 1 rx_valid = 1 / rx_data = 0xFF
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Idle
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Idle before start bit
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Start bit
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 0
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 1
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 2
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 3
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 4
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 5
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 6
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 7
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Stop bit

    rst_n = 0;
    #10;
    rst_n = 1;
    //Case 1 err_frame = 1 
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Idle
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Idle before start bit
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Start bit
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 0
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 1
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 2
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 3
    rx_serial = 1; repeat (BIT_PERIOD) @(posedge clk); // Data 4
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 5
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 6
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Data 7
    rx_serial = 0; repeat (BIT_PERIOD) @(posedge clk); // Stop bit

    $display("Test completed");
    $finish;
end

endmodule
