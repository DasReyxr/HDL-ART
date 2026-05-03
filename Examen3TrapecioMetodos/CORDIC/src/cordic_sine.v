module cordic_sine (
    input wire clk,
    input wire rst,
    input wire init,
    //input wire signed [16:0] theta_i,
    output wire signed [16:0] sine_o
);
parameter signed [16:0] FIXED_THETA = 17'sd45752; // 45 deg in Q2.15 rad


wire signed [16:0] x_o_int;
wire signed [16:0] y_o_int;
wire signed [16:0] debug_theta;
wire unused_record;
wire signed [16:0] theta_o;
wire signed [16:0] cosine_o;
reg init_d;
wire init_pulse;
localparam integer ITER_CYCLES = 16;
reg [4:0] iter_cnt;
reg busy;
reg result_valid;
reg signed [16:0] cosine_hold;
reg signed [16:0] sine_hold;

assign debug_theta = //theta_i ;
                    FIXED_THETA;
assign unused_record = 1'b1;
assign init_pulse = init & ~init_d;

always @(posedge clk or posedge rst) begin
    if (rst)
        init_d <= 1'b0;
    else
        init_d <= init;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        iter_cnt <= 5'd0;
        busy <= 1'b0;
        result_valid <= 1'b0;
        cosine_hold <= 17'sd0;
        sine_hold <= 17'sd0;
    end else begin
        if (init_pulse) begin
            iter_cnt <= 5'd0;
            busy <= 1'b1;
            result_valid <= 1'b0;
        end else if (busy) begin
            if (iter_cnt == ITER_CYCLES - 1) begin
                busy <= 1'b0;
                result_valid <= 1'b1;
                cosine_hold <= x_o_int;
                sine_hold <= y_o_int;
            end else begin
                iter_cnt <= iter_cnt + 5'd1;
            end
        end
    end
end

CORDIC_Top u_cordic (
    .clk(clk),
    .rst(rst),		
    .init(init_pulse),
    .x_i(17'sd19898), // CORDIC_INV_K
    .y_i(17'sd0),
    .theta_i(debug_theta),
    .x_o(x_o_int),
    .y_o(y_o_int),
    .theta_o(theta_o)
);

assign sine_o = sine_hold;

endmodule
