// ----------- Testbench -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// ------- Selector_tb --------
// ------- 18/04/2025 --------
// ------ Main Library -------

`timescale 1ns / 1ps

module Selector_tb;

    // Test signals
    logic A, B, S;
    logic Z;

    Selector dut (
        .A(A), .B(B), .S(S), .Z(Z) );

    // Test sequence
    initial begin
        $display("Time\tA B S | Z");
        $display("------------------");

        // Try all input combinations
        for (int i = 0; i < 8; i++) begin
            {A, B, S} = i;
            #5; // wait for output to settle
            $display("%0t\t%b %b %b | %b", $time, A, B, S, Z);
        end

        $display("Testbench finished.");
        $stop;
    end

endmodule
