//Full Adder TestBentch
`timescale 1ns/1ns
`include "Full_Adder.v" //Importamos el archivo al cual le hacemos su testbench


//Verilog HDL for "Verilog", "Full_Adder_TB" "functional"

module Full_Adder_tb();

integer i;    //for cycle variable
reg  A,B,Cin;   
wire S;       
wire Cout;

Full_Adder uut (A,B,Cin,S,Cout); 

initial begin
    $dumpfile("Full_Adder_tb.vcd"); 
    $dumpvars(0,Full_Adder_tb);
    
    $display("\tA\t|\tB\t|\tC\t|\tS\t|\tCout");

    for (i=0; i <= 7; i=i+1 ) begin

      A = i[2];
      B = i[1];
      Cin = i[0];
      #10;

    $display("\t%d\t|\t%d\t|\t%d\t|\t%d\t|\t%d",A,B,Cin,S,Cout);

    end

    $display("Test completed");

end
endmodule
