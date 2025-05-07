// ----------- Code -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// --------- Selector --------
// ------- 18/04/2025 --------
// ------ Main Library -------

module Selector (
    input  wire A, B, S,
    output wire Z
);

assign Z = (A & ~S) | (B & S);
//assign Z = S ? B : A;

endmodule
