module ShiftReg (clk,rst_n,Enable_A,Enable_B,data,Q);
input clk,rst_n,Enable_A,Enable_B; // clock, active low reset, enable signals
input data; // 4-bit parallel data input
output reg [7:0] Q; // 8-bit shift register output

always @(posedge clk) begin
    if (~rst_n) begin // If reset is active (low), clear the shift register
        Q <= 8'b0;
    end else if (Enable_A & Enable_B) begin
    Q <= {data, Q[7:1]}; // Shift right and insert data at LSB
    end
end

endmodule