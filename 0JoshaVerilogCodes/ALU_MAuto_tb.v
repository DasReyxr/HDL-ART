//ALU_M testbench
`timescale 1ns/1ps
`include "ALU_M.v" //Import the file to which we are making its testbench

module ALU_MAuto_tb ();
integer sel_var, A_var, B_var; //Variable for counting
reg  [7:0] A,B; //8-bit inputs
reg  [2:0] sel; //3-bit select input
wire [7:0] Z; //8-bit output
wire zero,carry,sign; //bitFlags

//Instantiate the module under test
ALU_M uut (A,B,sel,Z,zero,carry,sign);

initial begin

    $dumpfile("ALU_MAuto_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,ALU_MAuto_tb);     //Record all variable changes in the testbench

for (sel_var = 0; sel_var < 9; sel_var = sel_var + 1) begin  
    sel = sel_var[2:0];
   for (A_var = 0; A_var < 256; A_var = A_var + 1) begin
       A = A_var[7:0];
       for (B_var = 0; B_var < 256; B_var = B_var + 1) begin
           B = B_var[7:0];
            #10;
            if (sel_var == 0) begin
                if (Z !== (A + B)) begin
                    $display("Test failed for ADD: A=%h, B=%h ---> Expected Z=%h, got Z=%h", A, B, (A + B), Z);
                end else begin
                    $display("Test passed for ADD: A=%h, B=%h ---> Z=%h", A, B, Z);
                end
            end

            if (sel_var == 1) begin
                if (Z !== (A - B)) begin
                    $display("Test failed for SUB: A=%h, B=%h ---> Expected Z=%h, got Z=%h", A, B, (A - B), Z);
                end else begin
                    $display("Test passed for SUB: A=%h, B=%h ---> Z=%h", A, B, Z);
                end
            end

            if (sel_var == 2) begin
                if (Z !== (A & B)) begin
                    $display("Test failed for AND: A=%h, B=%h ---> Expected Z=%h, got Z=%h", A, B, (A & B), Z);
                end else begin
                    $display("Test passed for AND: A=%h, B=%h ---> Z=%h", A, B, Z);
                end
            end

            if (sel_var == 3) begin
                if (Z !== (A | B)) begin
                    $display("Test failed for OR: A=%h, B=%h ---> Expected Z=%h, got Z=%h", A, B, (A | B), Z);
                end else begin
                    $display("Test passed for OR: A=%h, B=%h ---> Z=%h", A, B, Z);
                end
            end

            if (sel_var == 4) begin
                if (Z !== (A ^ B)) begin
                    $display("Test failed for XOR: A=%h, B=%h ---> Expected Z=%h, got Z=%h", A, B, (A ^ B), Z);
                end else begin
                    $display("Test passed for XOR: A=%h, B=%h ---> Z=%h", A, B, Z);
                end
            end

            if (sel_var == 5) begin
                if (Z !== (~A)) begin
                    $display("Test failed for NOT: A=%h ---> Expected Z=%h, got Z=%h", A, (~A), Z);
                end else begin
                    $display("Test passed for NOT: A=%h ---> Z=%h", A, Z);
                end
            end

            if (sel_var == 6) begin
                if (Z !== ((A << 1))) begin
                    $display("Test failed for LLS: A=%h ---> Expected Z=%h, got Z=%h", A, (A << 1), Z);
                end else begin
                    $display("Test passed for LLS: A=%h ---> Z=%h", A, Z); 
                end
             end

            if (sel_var == 7) begin
                if (Z !== (A >> 1)) begin
                    $display("Test failed for LRS: A=%h ---> Expected Z=%h, got Z=%h", A, (A >> 1), Z);
                end else begin
                    $display("Test passed for LRS: A=%h ---> Z=%h", A, Z);
                end
            end

       end
    end
end
   
    $display("Test completed"); //Show message in console when test is completed   

end

endmodule
