module UART_lite (clk,rst_n,rx_serial,rx_data,rx_valid,err_frame);
input clk,rst_n; // clock and active low reset
input rx_serial; // Serial data input
output [7:0] rx_data; // 8-bit received data output
output  rx_valid; // Data valid flag
output  err_frame; // Framing error flag

reg [3:0] state, next_state; // State registers
wire MED, EN_SHIFT; // Middle value indicator and shift enable
wire [3:0] dummy; // Dummy for counter output (not used)


localparam IDLE   = 4'b0000, // State encoding
           START  = 4'b0001,
           DATA_0 = 4'b0010,
           DATA_1 = 4'b0011,
           DATA_2 = 4'b0100,
           DATA_3 = 4'b0101,
           DATA_4 = 4'b0110,
           DATA_5 = 4'b0111,
           DATA_6 = 4'b1000,
           DATA_7 = 4'b1001,
           STOP   = 4'b1010,
           DONE   = 4'b1011,
           ERROR  = 4'b1100;

always @(posedge clk ) begin // State transition logic
    if (!rst_n)
        state <= IDLE;
    else if (MED) state <= next_state;
end

always @(*) begin // Next state logic
    if ((rx_serial == 1'b1) && (state == IDLE)) begin
        state = IDLE;
    end 
    if ((rx_serial == 1'b1) && (state == START)) begin
        state = IDLE;
    end
    else begin
        case (state)
            IDLE:   next_state = START;
            START:   next_state = DATA_0;
            DATA_0: next_state = DATA_1;
            DATA_1: next_state = DATA_2;
            DATA_2: next_state = DATA_3;
            DATA_3: next_state = DATA_4;
            DATA_4: next_state = DATA_5;
            DATA_5: next_state = DATA_6;
            DATA_6: next_state = DATA_7;
            DATA_7: next_state = STOP; 
            STOP:   begin 
                    if (rx_serial == 1'b1)
                        next_state = DONE;
                    else next_state = ERROR;
                    end
            DONE:   next_state = IDLE;
            ERROR:  next_state = IDLE;
        endcase
    end
end

assign EN_SHIFT = ((state == DATA_0) || (state == DATA_1) || (state == DATA_2) || (state == DATA_3) ||
                   (state == DATA_4) || (state == DATA_5) || (state == DATA_6) || (state == DATA_7));
assign rx_valid =  (state == DONE);
assign err_frame = (state == ERROR);

Counter_4b U0 (.clk(clk), .rst_n(rst_n), .count(dummy), .MED(MED));
ShiftReg   U1 (.clk(clk), .rst_n(rst_n), .Enable_A(MED), .Enable_B(EN_SHIFT), .data(rx_serial), .Q(rx_data));

endmodule

//Shift Register module
module ShiftReg (clk,rst_n,Enable_A,Enable_B,data,Q);
input clk,rst_n,Enable_A,Enable_B; // clock, active low reset, enable signals
input data; // 4-bit serial data input
output reg [7:0] Q; // 8-bit shift register output

always @(posedge clk) begin
    if (~rst_n) begin // If reset is active (low), clear the shift register
        Q <= 8'b0;
    end else if (Enable_A & Enable_B) begin
    Q <= {data, Q[7:1]}; // Shift right and insert data at LSB
    end
end

endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Counter module
module Counter_4b (clk, rst_n, count,MED);
input clk,rst_n; // clock and active low reset
output reg [3:0] count; // 4-bit counter output
output MED; // Middle value indicator (1 when count is 7)

always @(posedge clk) begin
    if (~rst_n) begin // If reset is active (low), reset count to 0
        count <= 4'b0000;
    end else begin
        count <= count + 1; // Increment the counter
    end
end

assign MED = ~count[3] & count[2] & count[1] & count[0]; // MED is high when the condition is met (count == 7)

endmodule
