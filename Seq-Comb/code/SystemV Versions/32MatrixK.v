// Matrix keyboard scanner
// Verilog version of 32MatrixK.vhd

module TMATRICIAL (
    input  wire       CLK,
    input  wire [3:0] ColumnBus,
    output reg  [3:0] rowSelect,
    output reg  [3:0] LEDS
);
    reg [1:0] Count2 = 2'b00;

    // Increment only when no key is pressed on columns.
    always @(posedge CLK) begin
        if (ColumnBus == 4'b0000)
            Count2 <= Count2 + 1'b1;
    end

    // Active row selection with tri-state on non-selected rows.
    always @(*) begin
        case (Count2)
            2'b00: rowSelect = 4'b1zzz;
            2'b01: rowSelect = 4'bz1zz;
            2'b10: rowSelect = 4'bzz1z;
            2'b11: rowSelect = 4'bzzz1;
            default: rowSelect = 4'bzzzz;
        endcase
    end

    // Key decode map.
    always @(*) begin
        if      (Count2 == 2'b00 && ColumnBus == 4'b0000) LEDS = 4'b0000;
        else if (Count2 == 2'b00 && ColumnBus == 4'b0001) LEDS = 4'b0001;
        else if (Count2 == 2'b00 && ColumnBus == 4'b0010) LEDS = 4'b0010;
        else if (Count2 == 2'b00 && ColumnBus == 4'b0100) LEDS = 4'b0011;
        else if (Count2 == 2'b00 && ColumnBus == 4'b1000) LEDS = 4'b0100;

        else if (Count2 == 2'b01 && ColumnBus == 4'b0001) LEDS = 4'b0101;
        else if (Count2 == 2'b01 && ColumnBus == 4'b0010) LEDS = 4'b0110;
        else if (Count2 == 2'b01 && ColumnBus == 4'b0100) LEDS = 4'b0111;
        else if (Count2 == 2'b01 && ColumnBus == 4'b1000) LEDS = 4'b1000;

        else if (Count2 == 2'b10 && ColumnBus == 4'b0001) LEDS = 4'b1001;
        else if (Count2 == 2'b10 && ColumnBus == 4'b0010) LEDS = 4'b1010;
        else if (Count2 == 2'b10 && ColumnBus == 4'b0100) LEDS = 4'b1011;
        else if (Count2 == 2'b10 && ColumnBus == 4'b1000) LEDS = 4'b1100;

        else if (Count2 == 2'b11 && ColumnBus == 4'b0001) LEDS = 4'b1101;
        else if (Count2 == 2'b11 && ColumnBus == 4'b0010) LEDS = 4'b1110;
        else if (Count2 == 2'b11 && ColumnBus == 4'b0100) LEDS = 4'b1111;
        else LEDS = 4'bzzzz;
    end
endmodule
