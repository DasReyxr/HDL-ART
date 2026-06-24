//ALU_M testbench
`timescale 1ns/1ps
`include "ALU_M.v" //Import the file to which we are making its testbench

module ALU_M_tb ();
integer i; //Variable for counting
reg  [7:0] A,B; //8-bit inputs
reg  [2:0] sel; //3-bit select input
wire [7:0] Z; //8-bit output
wire zero,carry,sign; //bitFlags

//Instantiate the module under test
ALU_M uut (A,B,sel,Z,zero,carry,sign);

initial begin

    $dumpfile("ALU_M_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,ALU_M_tb);     //Record all variable changes in the testbench

    
   sel = 3'b000; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            B = $random & 8'hFF;
            #10;
        end

    sel = 3'b001; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            B = $random & 8'hFF;
            #10;
        end
    
    sel = 3'b010; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            B = $random & 8'hFF;
            #10;
        end

    sel = 3'b011; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            B = $random & 8'hFF;
            #10;
        end

    sel = 3'b100; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            B = $random & 8'hFF;
            #10;
        end

    sel = 3'b101; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            #10;
        end

    sel = 3'b110; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            #10;
        end

    sel = 3'b111; // Addition
        for (i = 0; i < 3; i = i + 1) begin
            A = $random & 8'hFF;
            #10;
        end
    
    //Especial cases
    //Addition with carry
    A = 8'hFF; B = 8'h01; sel = 3'b000; #10;
    //Subtraction with borrow
    A = 8'h00; B = 8'h01; sel = 3'b001; #10;
    //Subtraction resulting in zero
    A = 8'hFF; B = 8'hFF; sel = 3'b001; #10;
    //AND resulting in zero
    A = 8'hF0; B = 8'h0F; sel = 3'b010; #10;
    //OR resulting in zero
    A = 8'h00; B = 8'h00; sel = 3'b011; #10;
    //XOR resulting in zero
    A = 8'hAA; B = 8'hAA; sel = 3'b100; #10;
    //NOT operation on zero
    A = 8'hFF; sel = 3'b101; #10;
    //Left logical shift resulting in overflow
    A = 8'h80; sel = 3'b110; #10;
    //Right logical shift resulting in overflow
    A = 8'h01; sel = 3'b111; #10;
   
    $display("Test completed"); //Show message in console when test is completed   

end

endmodule
