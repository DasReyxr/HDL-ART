//FULL ADDER 4b+4b TestBench
`timescale 1ns/1ns
`include "FAdder4b.v" //Importamos el archivo al cual le hacemos su testbench

module FAdder4b_tb ();

reg [3:0] AM,BM;
reg CinM;
wire[4:0] Result;
wire CoutM;
wire[2:0] CoutS;

integer i;

Full_Adder_4b uut(AM,BM,CinM,Result,CoutM);

initial begin

    $dumpfile("FAdder4b_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,FAdder4b_tb);

    for (i=0; i<=15; i=i+1) begin

        AM = $random%16;
        BM = $random%16;
        CinM = $random%2;

        #10;

        $display("Iteration => %d ",i);
        $display("%d+%d+%d= %d ",AM,BM,CinM,Result);

        if(CoutM == 1)begin
             $display("Carry flag = 1");
        end
    end

    $display("Test completed");
    $finish();
end

endmodule