// ----------- Code -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// ------- Selector  -------
// ---- I date 03/24/2025 ----
// ---- C date 06/05/2025 ----
// ------- Main Library -------

module Selector (
    input  wire A,
    input  wire B,
    input  wire S,
    output wire Z
);

    assign Z = (A & ~S) | (B & S);
endmodule
