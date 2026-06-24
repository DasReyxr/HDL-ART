//FULL ADDER Nb+Nb TestBench
`timescale 1ns/1ns
`include "FAdder_generate.v" //Importamos el archivo al cual le hacemos su testbench

module FAdder_generate_tb ();

localparam  N = 4 ; //in the TB we use localparam and not parameter
reg [N-1:0] AM,BM;
reg CinM;
wire [N:0] Result;
wire CoutM;
wire [N:0] CoutS;

integer i; //for cycle variable

Full_Adder_generate uut(AM,BM,CinM,Result,CoutM);

initial begin

    $dumpfile("FAdder_generate_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,FAdder_generate_tb);

    for (i=0; i<=15; i=i+1) begin
        //urandom creates a random number 
        AM = $urandom%16; // we write 16 'cause chooses a random numbre from 0 to 15
        BM = $urandom%16;
        CinM = $urandom%2; //we write 2 'cause we choose a random number from 0 to 1

        #10; // waits 10ns

        $display("Iteration => %d ",i);
        $display("%d+%d+%d= %d ",AM,BM,CinM,Result);

        if(CoutM == 1)begin
             $display("Carry flag = 1");
        end
         
    end
    $finish();
    $display("Test completed");
   
end

endmodule