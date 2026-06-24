module FSM (V_out, A_out, R_out,Clk,Modo);

input Clk;
input Modo;
output V_out, A_out, R_out;
reg VS_out, AS_out, RS_out;
reg [2:0] state = 0;
reg [2:0] nextstate;

localparam A  = 3'b000;
localparam R1 = 3'b001;
localparam R2 = 3'b010;
localparam R3 = 3'b011;
localparam R4 = 3'b100;
localparam V1 = 3'b101;
localparam V2 = 3'b110;
localparam V3 = 3'b111;

//state register
always @(posedge Clk) begin
    if (Modo == 1'b1 && state == R1)begin
        state <= A;
    end  

    else if (Modo == 1'b0 && state == R1)begin
        state <= nextstate;
    end

    else begin
         state <= nextstate;
    end
end

//nextstate logic
 always @(*) begin
      case(state)
      A: nextstate = R1;
      R1: nextstate = R2;
      R2: nextstate = R3;
      R3: nextstate = R4;
      R4: nextstate = V1;
      V1: nextstate = V2;
      V2: nextstate = V3;
      V3: nextstate = A;
      default: nextstate = A;
      endcase
 end

always @(*) begin
 if (state == A) begin
     AS_out = 1'b1;
 end

 else begin
        AS_out = 1'b0;
    end
end

assign A_out = AS_out;

 always @(*) begin
    if (state == R1 || state == R2 || state == R2 || state == R4) begin
        RS_out = 1'b1;
    end 
    
    else begin
        RS_out = 1'b0;
    end
end

assign R_out = RS_out;

 always @(*) begin
    if (state == V1 || state == V2 || state == V3) begin
        VS_out = 1'b1;
    end 
    
    else begin
        VS_out = 1'b0;
    end
end

assign V_out = VS_out;

endmodule