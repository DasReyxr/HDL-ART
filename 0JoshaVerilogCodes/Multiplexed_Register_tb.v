//MULTIPLEXED REGISTER TEST BENCH
`timescale 1ns/1ns
`include "Multiplexed_Register.v" //Importamos el archivo al cual le hacemos su testbench

module multiplexed_register_tb ();

reg  [3:0] Data;
reg  [2:0] Select;
reg  [2:0] Read;
wire [3:0] Out;
wire [3:0] Clk;
wire [3:0] Reg_0, Reg_1, Reg_2, Reg_3;

multiplexed_register uut(Data,Select,Read,Out);

initial begin

    $dumpfile("Multiplexed_Register_tb.vcd");
    $dumpvars(0,multiplexed_register_tb);
    $display("Start");

    Data = 4'b1101; //D
    Select = 2'b00;
    Read = 2'b00;
    #10;
    Data = 4'b0011; //D
    #10;
    $display("A");
    Data = 4'b1111; //F
    Select = 2'b01;
    Read = 2'b01;
    #20;
    $display("B");
    Data = 4'b0110; //6
    Select = 2'b10;
    Read = 2'b10;
    #20;
    $display("C");
    Data = 4'b1000; //8
    Select = 2'b11;
    Read = 2'b11;
    #20;
    $display("D");
    
    Data = 4'b1010; //A
    Select = 2'b00;
    Read = 2'b00;
    #20;
    $display("E");
    Data = 4'b0001; //1
    Select = 2'b01;
    Read = 2'b01;
    #20;
    $display("F");
    Data = 4'b0111; //7
    Select = 2'b10;
    Read = 2'b10;
    #20;
    $display("G");
    Data = 4'b0011; //3
    Select = 2'b11;
    Read = 2'b11;
    #20;
    $display("H");

    $display("Test completed");

end

endmodule
