`timescale 1ns/1ps

module Guzzer_tb;
    reg  CLK;
    reg  Enable;
    wire BuzzerOut;

    integer errors;

    Guzzer dut (
        .CLK(CLK),
        .Enable(Enable),
        .BuzzerOut(BuzzerOut)
    );

    // 100 MHz clock
    initial CLK = 1'b0;
    always #5 CLK = ~CLK;

    // Enable waveform dump for EPWave
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, Guzzer_tb);
    end

    task check_buzzer;
        input expected;
        input [255:0] msg;
        begin
            #1;
            if (BuzzerOut !== expected) begin
                $display("[FAIL] %0t %0s | expected=%b got=%b", $time, msg, expected, BuzzerOut);
                errors = errors + 1;
            end else begin
                $display("[PASS] %0t %0s | BuzzerOut=%b", $time, msg, BuzzerOut);
            end
        end
    endtask

    initial begin
        errors  = 0;
        Enable  = 1'b0;

        // At reset-like startup, Actual starts at 0 and Enable=0, so output should be 0.
        #2;
        check_buzzer(1'b0, "Enable=0 at startup");

        // With Enable=1, output should be forced to 1.
        Enable = 1'b1;
        #2;
        check_buzzer(1'b1, "Enable=1");

        // Drive many clocks with Enable=0 to see counter increment and overflow.
        Enable = 1'b0;
        repeat (2500) begin
            @(posedge CLK);
            #1;
            $display("t=%0t Actual=%0d BuzzerOut=%b", $time, dut.Actual, BuzzerOut);
        end

        // Final result
        if (errors == 0)
            $display("[TB PASS] No errors detected.");
        else
            $display("[TB FAIL] Total errors: %0d", errors);

        $finish;
    end
endmodule
