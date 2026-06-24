module Counter_4b (clk, rst_n, count,MED);
input clk,rst_n; // clock and active low reset
output reg [3:0] count; // 4-bit counter output
output MED; // Middle value indicator (1 when count is 7)

always @(posedge clk) begin
    if (~rst_n) begin // If reset is active (low), reset count to 0
        count <= 4'b0000;
    end else begin
        count <= count + 1; // Increment the counter
    end
end

assign MED = ~count[3] & count[2] & count[1] & count[0]; // MED is high when count is 7 (0111)

endmodule