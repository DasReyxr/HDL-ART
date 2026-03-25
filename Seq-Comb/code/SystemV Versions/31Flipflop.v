// ----------- Code -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// ------- D Flipflop  -------
// ---- I date 03/24/2026 ----
// ------- Main Library -------

module Flipflop (
    input  wire CLK,
    input  wire D,
    output reg  Q
);
    // always @(posedge CLK) begin
    always @(negedge CLK) begin
        Q <= D;
    end
endmodule
