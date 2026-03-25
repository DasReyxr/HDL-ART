// ----------- Code -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// ---------- Guzzer ----------
// -------- 03/24/2026 --------
// ------- Main Library -------

module Guzzer (
    input  wire CLK,
    input  wire Enable,
	output reg  BuzzerOut
);
	reg [11:0] Siguiente = 12'd0;
	reg [11:0] Actual    = 12'd0;
	// Memoria
	always_ff @(posedge CLK) begin
        Actual <= Siguiente;
    end
	// --- Logica de estado siguiente --
	always_comb begin
		if (Actual < 12'd7)
			Siguiente = Actual + 1'b1;
		else
			Siguiente = 12'd0;
	end
	// --- Logica de salida ---
	always_comb begin
		if (Actual <= 12'd7 && Enable == 1'b0)
			BuzzerOut = 1'b0;
		else
			BuzzerOut = 1'b1;
	end
	

endmodule
