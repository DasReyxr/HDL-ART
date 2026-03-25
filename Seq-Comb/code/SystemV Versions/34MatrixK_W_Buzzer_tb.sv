`timescale 1ns/1ps

module Guzzer_tb;
    reg  CLK;
    reg [3:0] regSelect;
    reg [3:0] ColumnBus;
    wire BuzzerOut;

    integer errors;

    Guzzer dut (
        .CLK(CLK),
        .BuzzerOut(BuzzerOut),
        .rowSelect(regSelect),
        .ColumnBus(ColumnBus)
    );

    // 100 MHz clock
    initial CLK = 1'b0;
    always #5 CLK = ~CLK;

    // Enable waveform dump for EPWave
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, Guzzer_tb);
    end


    initial begin
        ColumnBus = 4'b0000;
        repeat (2500) begin
            @(posedge CLK);
            #1;
            $display("t=%0t | Actual=%4d | BuzzerOut=%b", $time, dut.Actual, BuzzerOut);
        end

        $finish;
    end
endmodule