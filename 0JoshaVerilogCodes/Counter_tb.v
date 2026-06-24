//Counter REGISTER TEST BENCH
`timescale 1ns/1ns
`include "Counter.v" //Importamos el archivo al cual le hacemos su testbench

module Counter_tb ();

reg Enable;
reg [7:0] Data;
reg Load;
reg Clk;
reg Reset;
wire [7:0] Out;
wire [7:0] qout;

Counter uut(Enable,Data,Load,Clk,Out,Reset,qout);

initial begin

    $dumpfile("Counter_tb.vcd");
    $dumpvars(0,Counter_tb);
    $display("Start");
    
    Clk = 1;
    Enable = 0;
    Reset = 0;
    Load = 1;
    Data = 4'b0000; //D
    #10;
    Clk = 0;
    
    
    #10;
    Clk = 1;

    #10;
    Clk = 0;

    Reset = 1;
    Clk = 0;
    Data = 4'b1101; //D
    Enable = 1;
    Load = 0;
    Reset = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;

    #10;
    Clk = 0;
    Data = 4'b0011; //3
    Enable = 1;
    Load = 0;
    Reset = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;

   #10;
    Clk = 0;
    Enable = 0;
    Load = 1;
    Reset = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1; 

    #10;
    Clk = 0;
    Enable = 1;
    Load = 0;
    Reset = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;

    #10;
    Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;
        #10;
    Clk = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;

    Enable = 0;
    Load = 0;

    #10;
    Clk = 0;
    Data = 4'b1111; //F
    Enable = 1;
    Load = 0;
    Reset = 0;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;
    Enable = 0;
    Load = 0;
    #10;
    Clk = 0;
    Enable = 0;
    Load = 0;
    Reset = 1;
    #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;

 #10;
    Clk = 0;
     #10;
    Clk = 1;
    #10;
    Clk = 0;
    #10;
    Clk = 1;
    $display("Test completed");

end

endmodule