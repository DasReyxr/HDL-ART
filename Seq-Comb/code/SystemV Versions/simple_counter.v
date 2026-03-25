module simple_counter (
    input  wire clk,
    input  wire rst,
    output reg  [3:0] q
);
    always @(posedge clk) begin
            q <= q + 1'b1;
    end
endmodule
