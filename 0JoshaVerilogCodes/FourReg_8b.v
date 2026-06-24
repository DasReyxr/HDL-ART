// Four 8-bit registers with write enable and reset
module FourReg_8b (clk,rst_n,en_write,addr,write_data,out_0,out_1,out_2,out_3);
input clk,rst_n,en_write; // clock, active low reset, write enable
input [1:0] addr; // 2-bit address to select one of the four registers
input [7:0] write_data; // 8-bit data to be written to the selected register
output reg [7:0] out_0,out_1,out_2,out_3; // 8-bit outputs for each of the four registers

 always @(posedge clk) begin // On the rising edge of the clock
    if (~rst_n) begin // If reset is active (low) all registers are cleared to 0
        out_0 <= 8'b0;
        out_1 <= 8'b0;
        out_2 <= 8'b0;
        out_3 <= 8'b0;
    end else if (en_write) begin // If write enable is high, write data to the selected register
        case (addr) // Select the register based on the address
            2'b00: out_0 <= write_data;
            2'b01: out_1 <= write_data;
            2'b10: out_2 <= write_data;
            2'b11: out_3 <= write_data;
            default: ;
        endcase
    end
end

endmodule