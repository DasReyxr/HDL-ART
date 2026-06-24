//Four registers with 8-bit width, write enable and reset testbench
`timescale 1ps/1ps
`include "FourReg_8b.v"

module FourReg_8bAuto_tb ();
integer addr_var, write_data_var;
integer response_char;
reg [7:0] result;
reg clk, rst_n, en_write;
reg [1:0] addr;
reg [7:0] write_data;
wire [7:0] out_0, out_1, out_2, out_3;

FourReg_8b uut (clk, rst_n, en_write, addr, write_data, out_0, out_1, out_2, out_3);

initial begin
    $dumpfile("FourReg_8bAuto_tb.vcd");
    $dumpvars(0,FourReg_8bAuto_tb);
    
    rst_n = 0; en_write = 0; 
    clk = 0;
    #10
    clk = 1;
    rst_n = 1; en_write = 1;
    #10;

    for (addr_var = 0; addr_var < 4; addr_var = addr_var + 1) begin
        addr = addr_var[1:0];
        for (write_data_var = 0; write_data_var < 256; write_data_var = write_data_var + 1) begin

            write_data = 8'h00;
            clk = 0; #10;
            clk = 1; #10;

            if (addr == 2'b00) begin
                $display("Known state: %h", out_0);
            end else if (addr == 2'b01) begin
                $display("Known state: %h", out_1);
            end else if (addr == 2'b10) begin
                $display("Known state: %h", out_2);
            end else begin
                $display("Known state: %h", out_3);
            end
       
            write_data = write_data_var[7:0];
            clk = 0; #10;
            $display("Writing %h to register %d", write_data, addr);
            clk = 1; #10;

            case (addr)
                2'b00: result = out_0;
                2'b01: result = out_1;
                2'b10: result = out_2;
                2'b11: result = out_3;
            endcase

            if (result != write_data) begin
                $display("Test failed for addr = %d ---> Expected data = %h, got data = %h", addr, write_data, result);
                $display("Time = %0t ps", $time);
            end else begin
                $display("Test passed for addr = %d ---> Data = %h", addr, write_data);
                $display("Time = %0t ps", $time);
            end

        end
    end

    $display("Test completed");
    $finish;
end
endmodule
