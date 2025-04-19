// ----------- Testbench -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// -------- Display7_tb -------
// ------- 27/05/2024 --------
// ------ Main Library -------

`timescale 1ns / 1ps

module Display7_tb;

    // Testbench signals
    logic [3:0] Sw;
    logic [6:0] Disp;

    // Instantiate the DUT (Device Under Test)
    Display7 dut (
        .Sw(Sw),
        .Disp(Disp)
    );

    // Test procedure
    initial begin
        $display("Starting Display7 Testbench");
        $display("Time\tSw\tDisp");

        // Test all values from 0 to 15
        for (int i = 0; i < 16; i++) begin
            Sw = i;
            #10; // wait 10 ns
            $display("%0t\t%b\t%b", $time, Sw, Disp);
        end

        $display("Testbench finished");
        $stop;
    end

endmodule
