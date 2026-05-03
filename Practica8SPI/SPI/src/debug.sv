module spi_rx_mode3_16b (
    input  wire       rst,
    input  wire       nss,
    input  wire       sclk,
    input  wire       mosi,
    output reg [15:0] data_o,
    output reg        data_valid_o
);
wire    recording;
reg [15:0] shift_reg;
reg [3:0]  bit_count;

assign recording = 1'b1;

// SPI mode 3 (CPOL=1, CPHA=1): sample MOSI on rising edge of SCLK.
always @(posedge sclk or posedge rst or posedge nss) begin
    if (rst) begin
        shift_reg    <= 16'h0000;
        bit_count    <= 4'd0;
        data_o       <= 16'h0000;
        data_valid_o <= 1'b0;
    end else if (nss) begin
        // Deselect: reset the shifter/counter even if SCLK stops,
        // but keep last captured data_o.
        shift_reg    <= 16'h0000;
        bit_count    <= 4'd0;
        data_valid_o <= 1'b0;
    end else begin
        // Selected (nss == 0): shift in 16 bits, MSB-first
        shift_reg <= {shift_reg[14:0], mosi};

        if (bit_count == 4'd15) begin
            data_o       <= {shift_reg[14:0], mosi};
            data_valid_o <= 1'b1;
            bit_count    <= 4'd0;
        end else begin
            data_valid_o <= 1'b0;
            bit_count    <= bit_count + 4'd1;
        end
    end
end

endmodule
