`timescale 1ns/1ps

module cordic_tb;

reg clk;
reg rst;
reg signed [16:0] theta_i;

wire signed [16:0] x_o;
wire signed [16:0] y_o;
wire signed [16:0] theta_o;

localparam signed [16:0] CORDIC_INV_K = 17'sd19898; // 0.607252 * 32768
localparam integer PIPELINE_LATENCY = 16;

CORDIC_Top dut (
    .clk(clk),
    .rst(rst),
    .x_i(CORDIC_INV_K),
    .y_i(17'sd0),
    .theta_i(theta_i),
    .x_o(x_o),
    .y_o(y_o),
    .theta_o(theta_o)
);

always #5 clk = ~clk;

function real q15_to_real;
    input signed [16:0] v;
    begin
        q15_to_real = v / 32768.0;
    end
endfunction

task run_case;
    input signed [16:0] angle;
    input [8*24-1:0] name;
    integer i;
    begin
        theta_i = angle;
        for (i = 0; i < PIPELINE_LATENCY + 2; i = i + 1) begin
            @(posedge clk);
        end

        $display("[%0t] %0s", $time, name);
        $display("  theta_i = %0d", angle);
        $display("  cos(x_o)= %0d (%f)", x_o, q15_to_real(x_o));
        $display("  sin(y_o)= %0d (%f)", y_o, q15_to_real(y_o));
        $display("");
    end
endtask

initial begin
    clk = 1'b0;
    rst = 1'b1;
    theta_i = 17'sd0;

    repeat (4) @(posedge clk);
    rst = 1'b0;
    repeat (2) @(posedge clk);

    // Angles in Q2.15 radians
    run_case( 17'sd0,     "0 deg");
    run_case( 17'sd17157, "30 deg");
    run_case( 17'sd25736, "45 deg");
    run_case( 17'sd34315, "60 deg");
    run_case( 17'sd51472, "90 deg");
    run_case(-17'sd25736, "-45 deg");

    $finish;
end

endmodule
