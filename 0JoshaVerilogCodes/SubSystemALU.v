//Sub System for ALU
module SubSystemALU(clk,rst_n,next_instruction,out_0,out_1,out_2,out_3,zero_flag,carry_flag,sign_flag,next_instruction_signal_visual);
input clk,rst_n; // clock and active low reset
input [9:0] next_instruction; // 9-bit instruction input
output [9:0] next_instruction_signal_visual; // For visualization in testbench
output [7:0] out_0,out_1,out_2,out_3; // 8-bit outputs from the four registers
output zero_flag,carry_flag,sign_flag; // status flags

reg [9:0] next_instruction_signal; // Register to hold the next instruction
wire mode = next_instruction_signal[9]; // mode bit (0 writes in reg0 or reg1, 1 uses ALU writes in all regs
//For mode = 0
wire R_sel = next_instruction_signal[8]; // register select bit (0 for reg0, 1 for reg1)
wire [7:0] data = next_instruction_signal[7:0]; // data to wite
//For mode = 1
wire [2:0] opcode_s = next_instruction_signal[8:6]; // Selector for ALU operation
wire [1:0] A_sel_s = next_instruction_signal[5:4]; // Selector for loading A input
wire [1:0] B_sel_s = next_instruction_signal[3:2]; // Selector for loading B input
wire [1:0] dest_sel = next_instruction_signal[1:0]; // Selector for address of destination register

reg [7:0] write_data; // Data to be written to the registers
reg [1:0] addr; // Address of the register to write to
reg [2:0] opcode; // ALU operation code
reg [2:0] A_sel,B_sel; // Selectors for ALU inputs
wire [7:0] A_in,B_in; // Inputs to ALU
wire [7:0] ALU_out; // Output from ALU
reg en_write = 1'b1; // Write enable for registers

always @(posedge clk) begin
    if (~rst_n)
        next_instruction_signal <= 10'b0;
        else next_instruction_signal <= next_instruction;
end

assign next_instruction_signal_visual = next_instruction_signal; // For visualization in testbench

always @(*) begin
    if (mode == 1'b0) begin
        write_data = data;
        addr = {1'b0,R_sel}; // Address is 0 for reg0, 1 for reg1
        en_write = 1'b1; // Enable writing to the selected register
    end else begin
        opcode = opcode_s; // Set ALU operation code
        A_sel = A_sel_s; // Select A input based on A_sel
        B_sel = B_sel_s; // Select B input based on B_sel
        addr = dest_sel; // Address for destination register
        write_data = ALU_out; // Data to write is the ALU output
        en_write = 1'b1; // Enable writing to the selected register
    end
end

// Select A input based on A_sel
assign A_in  = (A_sel == 2'b00) ? out_0 :
               (A_sel == 2'b01) ? out_1 :
               (A_sel == 2'b10) ? out_2 : 
                                  out_3 ;
        // Select B input based on B_sel
assign B_in  = (B_sel == 2'b00) ? out_0 :
               (B_sel == 2'b01) ? out_1 :
               (B_sel == 2'b10) ? out_2 :
                                  out_3 ;

FourReg_8b U0 (.clk(clk),.rst_n(rst_n),.en_write(en_write),.addr(addr),.write_data(write_data),.out_0(out_0),.out_1(out_1),.out_2(out_2),.out_3(out_3));
ALU_M U1 (.A(A_in),.B(B_in),.sel(opcode),.Z(ALU_out),.zero(zero_flag),.carry(carry_flag),.sign(sign_flag));

endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Four 8-bit registers with write enable and reset
module FourReg_8b (clk,rst_n,en_write,addr,write_data,out_0,out_1,out_2,out_3);
input clk,rst_n,en_write; // clock, active low reset, write enable
input [1:0] addr; // 2-bit address to select one of the four registers
input [7:0] write_data; // 8-bit data to be written to the selected register
output reg [7:0] out_0,out_1,out_2,out_3; // 8-bit outputs for each of the four registers

 always @(posedge clk) begin // On the rising edge of the clock
    if (~rst_n) begin // If reset is active (low) all registers are cleared to 0
        out_0 <= 8'b0;
        out_1 <= 8'b0;
        out_2 <= 8'b0;
        out_3 <= 8'b0;
    end else if (en_write) begin // If write enable is high, write data to the selected register
        case (addr) // Select the register based on the address
            2'b00: out_0 <= write_data;
            2'b01: out_1 <= write_data;
            2'b10: out_2 <= write_data;
            2'b11: out_3 <= write_data;
            default: ;
        endcase
    end
end
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ALU module
module ALU_M(A,B,sel,Z,zero,carry,sign);

input [7:0] A,B; // 8-bit inputs
input [2:0] sel; // 3-bit select line
output [7:0] Z; // 8-bit output
output zero,carry,sign; // bitFlags

wire [7:0] AoS,AND,OR,XOR,NOT,LLS,LRS; // Intermediate wires for each operation
wire [8:0] TC; // Output from subtraction
wire CoB, Enable_S;

// Instantiate each operation module
ADD_8b U0(.A(A),.B(TC),.Cin(Enable_S),.S(AoS),.Cout(CoB));
TC_8b  U1(.A(B),.Enable(Enable_S),.Z(TC));
AND_8b U2(.A(A),.B(B),.Z(AND));
OR_8b  U3(.A(A),.B(B),.Z(OR));
XOR_8b U4(.A(A),.B(B),.Z(XOR));
NOT_8b U5(.A(A),.Z(NOT));
LLS_8b U6(.A(A),.Z(LLS));
LRS_8b U7(.A(A),.Z(LRS));

assign Enable_S = (~sel[2]) & (~sel[1]) & (sel[0]); // Enable signal for addition/subtraction
assign carry = ((~sel[2]) & (~sel[1]) & (~sel[0])) & CoB; // Carry flag only for addition
assign sign = ((~sel[2]) & (~sel[1]) & (sel[0])) & CoB;
assign zero = ~(|Z); // Zero flag

assign Z = (sel == 3'b000) ? AoS :
           (sel == 3'b001) ? AoS : // Subtraction uses the same output as addition
           (sel == 3'b010) ? AND :
           (sel == 3'b011) ? OR :
           (sel == 3'b100) ? XOR :
           (sel == 3'b101) ? NOT :
           (sel == 3'b110) ? LLS :
            LRS ; // Default case            
endmodule

//8-bit Adder
module ADD_8b(A,B,Cin,S,Cout);
input [7:0] A;
input [8:0] B;
input Cin;
output [7:0] S;
output Cout;
wire  [7:0] CO_S;
wire dummy;

FA U0(.A(A[0]),.B(B[0]),.Cin(Cin)    ,.S(S[0]),.Cout(CO_S[0]));
FA U1(.A(A[1]),.B(B[1]),.Cin(CO_S[0]),.S(S[1]),.Cout(CO_S[1]));
FA U2(.A(A[2]),.B(B[2]),.Cin(CO_S[1]),.S(S[2]),.Cout(CO_S[2]));
FA U3(.A(A[3]),.B(B[3]),.Cin(CO_S[2]),.S(S[3]),.Cout(CO_S[3]));
FA U4(.A(A[4]),.B(B[4]),.Cin(CO_S[3]),.S(S[4]),.Cout(CO_S[4]));
FA U5(.A(A[5]),.B(B[5]),.Cin(CO_S[4]),.S(S[5]),.Cout(CO_S[5]));
FA U6(.A(A[6]),.B(B[6]),.Cin(CO_S[5]),.S(S[6]),.Cout(CO_S[6]));
FA U7(.A(A[7]),.B(B[7]),.Cin(CO_S[6]),.S(S[7]),.Cout(CO_S[7]));
FA U8(.A(1'b0),.B(B[8]),.Cin(CO_S[7]),.S(Cout),.Cout(dummy)); 
endmodule

//8-bit Full Adder
module FA (A,B,S,Cin,Cout);
input A,B,Cin;
output S,Cout;

assign S = (A ^ B) ^ Cin;
assign Cout = (A & B) | ((A ^ B) & Cin);
endmodule

//8-bit twos complement
module TC_8b(A,Enable,Z);
input [7:0] A;
input Enable;
output [8:0] Z;
wire [8:0] A_1; //Add the sign bit

assign A_1[8] = 1'b0; 
assign A_1[7:0] = A;
assign Z = A_1 ^ {9{Enable}}; // If Enable is 1, invert bits
endmodule

//8-bit AND
module AND_8b(A,B,Z);
input [7:0] A,B;
output [7:0] Z;

assign Z = A & B;
endmodule

//8-bit OR
module OR_8b(A,B,Z);
input [7:0] A,B;
output [7:0] Z;

assign Z = A | B;
endmodule

//8-bit XOR
module XOR_8b(A,B,Z);
input [7:0] A,B;
output [7:0] Z;

assign Z = A ^ B;
endmodule

//8-bit NOT
module NOT_8b(A,Z);
input [7:0] A;
output [7:0] Z;

assign Z = ~A;
endmodule

//8-bit Logical Left Shift
module LLS_8b(A,Z);
input [7:0] A;
output [7:0] Z;

assign Z = A << 1;
endmodule

//8-bit Logical Right Shift
module LRS_8b(A,Z);
input [7:0] A;
output [7:0] Z;

assign Z = A >> 1;
endmodule