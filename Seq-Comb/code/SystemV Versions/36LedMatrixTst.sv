// ----------- Code -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// -------- LedMatrix --------
// -------- 03/24/2026 --------
// ------- Main Library -------

module LedMatrix (
    input wire CLK,
    input wire SW,
    output reg CS, 
    output reg CLK2,
    output reg DIN
);
    reg[2:0] CountCLK = 3'd0;
    reg Enable = 1'b0; 
    reg[6:0] Actual = 7'd0;
    reg[6:0] Siguiente = 7'd0;


	always_ff @(posedge CLK) begin
		if(Enable == 1'd1) 
        CountCLK <= CountCLK + 1'b1;
	// Memoria
	     Actual <= Siguiente;
    
    end
	
    always_comb begin
        if(SW == 1'b0 || Actual > 7'd0) Enable = 1'b1;
        else Enable = 1'b0;
    // --- Logica de estado siguiente --
		if (Actual < 7'd67 && (SW == 1'b0 || Actual > 7'd0)) Siguiente = Actual + 1'b1;
		else Siguiente = 7'd0;
	// --- Logica de salida ---
		if(Enable == 1'b1 && Actual < 7'd64) CS = 1'b0; else CS = 1'b1;
	
        CLK2 = CountCLK[0];
        DIN = 1'b1;
    end

endmodule
