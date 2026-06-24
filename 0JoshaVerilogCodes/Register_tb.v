//MULTIPLEXED REGISTER TEST BENCH
`timescale 1ns/1ns
`include "Registers.v" //Importamos el archivo al cual le hacemos su testbench

module register_tb ();

reg  [3:0] Data;
reg  [1:0] Select;
reg  [1:0] Read;
wire [3:0] Out;
reg  Clk;
wire [3:0] Reg_0, Reg_1, Reg_2, Reg_3;

register uut(Data,Select,Read,Out,Clk);

initial begin

    $dumpfile("Register_tb.vcd");
    $dumpvars(0,register_tb);
    $display("Start");

    Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    Data = 4'b1101; //D
    Select = 2'b00;
    Read = 2'b00;

    Clk = 1;
    #10;
    Clk = 0;
    #10;

    Data = 4'b0011; //D

    #10;
    Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    $display("A");
    Data = 4'b1111; //F
    Select = 2'b01;
    Read = 2'b01;
    #20;

    Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    $display("B");
    Data = 4'b0110; //6
    Select = 2'b10;
    Read = 2'b10;
    #20;

    Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    $display("C");
    Data = 4'b1000; //8
    Select = 2'b11;
    Read = 2'b11;
    #20;

        Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    $display("D");
    
    Data = 4'b1010; //A
    Select = 2'b00;
    Read = 2'b00;
    #20;

        Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    $display("E");
    Data = 4'b0001; //1
    Select = 2'b01;
    Read = 2'b01;
    #20;

        Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    $display("F");
    Data = 4'b0111; //7
    Select = 2'b10;
    Read = 2'b10;
    #20;

        Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;

    $display("G");
    Data = 4'b0011; //3
    Select = 2'b11;
    Read = 2'b11;
    #20;
        Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    $display("H");

    $display("Test completed");

end

endmodule
