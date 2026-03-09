// ----------- Code -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// --------- 1 Flipflop --------
// ------- 13/08/2024 --------
// ------ Main Library -------

module Flipflop (
    input  logic CLK,  // Clock input
    input  logic D,    // Data input
    output logic Q     // Output Q
);

    always_ff @(negedge CLK) begin
        Q <= D; 
    end

endmodule
