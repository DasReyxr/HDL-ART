// ----------- Code -----------
// ------ Orlando Reyes ------
// --------- Auf Das ---------
// ---------- Guzzer ----------
// -------- 03/24/2026 --------
// ------- Main Library -------

module Guzzer (
    input  wire CLK,
	// Sequencer 
    output reg  [3:0] rowSelect,
	// Matrix K
	input  wire [3:0] ColumnBus,

	output reg  BuzzerOut
);
    localparam [16:0] DO_MICHA       = 17'd191111; 
    localparam [16:0] DO_SOS_MICHA  = 17'd180390; 
    localparam [16:0] RE_MICHA       = 17'd170266; 
    localparam [16:0] RE_SOS_MICHA  = 17'd160706; 
    localparam [16:0] MI_MICHA       = 17'd151687; 
    localparam [16:0] FA_MICHA       = 17'd143174; 
    localparam [16:0] FA_SOS_MICHA  = 17'd135140; 
    localparam [16:0] SOL_MICHA      = 17'd127553; 
    localparam [16:0] SOL_SOS_MICHA = 17'd120396; 
    localparam [16:0] LA_MICHA       = 17'd113638; 
    localparam [16:0] LA_SOS_MICHA  = 17'd107261; 
    localparam [16:0] SI_MICHA       = 17'd101241; 
    


	reg [1:0] Count2 = 2'b00;
	reg [17:0] Siguiente = 17'd0;
	reg [17:0] Actual    = 17'd0;

	reg [16:0] muxNota = 17'd0;
	reg [3:0] SequencerBus = 4'b0000;


	always_ff @(posedge CLK) begin
		if(ColumnBus == 4'd0) 
        Count2 <= Count2 + 1'b1;

    end
	
	// Poleo
	always @(*) begin
        case (Count2)
            2'b00: rowSelect = 4'b1zzz;
            2'b01: rowSelect = 4'bz1zz;
            2'b10: rowSelect = 4'bzz1z;
            2'b11: rowSelect = 4'bzzz1;
            default: rowSelect = 4'bzzzz;
        endcase
    end

	// Sequencer Bus
    always_comb begin
        if      (Count2 == 2'b00 && ColumnBus == 4'b0000) SequencerBus = 4'd0;
        else if (Count2 == 2'b00 && ColumnBus == 4'b0001) SequencerBus = 4'd1;
        else if (Count2 == 2'b00 && ColumnBus == 4'b0010) SequencerBus = 4'd2;
        else if (Count2 == 2'b00 && ColumnBus == 4'b0100) SequencerBus = 4'd3;
        else if (Count2 == 2'b00 && ColumnBus == 4'b1000) SequencerBus = 4'd4;

        else if (Count2 == 2'b01 && ColumnBus == 4'b0001) SequencerBus = 4'd5;
        else if (Count2 == 2'b01 && ColumnBus == 4'b0010) SequencerBus = 4'd6;
        else if (Count2 == 2'b01 && ColumnBus == 4'b0100) SequencerBus = 4'd7;
        else if (Count2 == 2'b01 && ColumnBus == 4'b1000) SequencerBus = 4'd8;

        else if (Count2 == 2'b10 && ColumnBus == 4'b0001) SequencerBus = 4'd9;
        else if (Count2 == 2'b10 && ColumnBus == 4'b0010) SequencerBus = 4'd10;
        else if (Count2 == 2'b10 && ColumnBus == 4'b0100) SequencerBus = 4'd11;
        else if (Count2 == 2'b10 && ColumnBus == 4'b1000) SequencerBus = 4'd12;

        else if (Count2 == 2'b11 && ColumnBus == 4'b0001) SequencerBus = 4'd13;
        else if (Count2 == 2'b11 && ColumnBus == 4'b0010) SequencerBus = 4'd14;
        else if (Count2 == 2'b11 && ColumnBus == 4'b0100) SequencerBus = 4'd15;
        else SequencerBus = 4'd0;
    end
	// Mux Nota

	always_comb begin
        case (SequencerBus)
            4'd0: muxNota = DoMicha;
            4'd1: muxNota = DoSosMicha;
            4'd2: muxNota = ReMicha;
            4'd3: muxNota = ReSosMicha;
            4'd4: muxNota = MiMicha;
            4'd5: muxNota = FaMicha;
            4'd6: muxNota = FaSosMicha;
            4'd7: muxNota = SolMicha;
			4'd8: muxNota = SolSosMicha;
			4'd9: muxNota = LaMicha;
			4'd10: muxNota = LaSosMicha;
			4'd11: muxNota = SiMicha;
		    default: muxNota = 17'd0;
        endcase
    end


	// Memoria
	always_ff @(posedge CLK) begin
        Actual <= Siguiente;
    end
	// --- Logica de estado siguiente --
	always_comb begin
		if (Actual < (muxNota << 1)) Siguiente = Actual + 1'b1;
		else Siguiente = 17'd0;
	end
	// --- Logica de salida ---
	always_comb begin
		if (Actual < muxNota && ColumnBus != 4'b0000) BuzzerOut = 1'b0;
		else BuzzerOut = 1'b1;
	end
	

endmodule
