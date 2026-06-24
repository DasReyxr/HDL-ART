//Full_Adder_M TestBentch
`timescale 1ns/1ns
`include "Full_Adder_M.v" //Import from wich module we are doig the testbench

module Full_Adder_M_tb();

integer i; //Varaiable for counting
reg  A,B,Cin;  //Create registers for our inputs
wire S,Cout;   //Create wires for our outputs

Full_Adder_M uut (A,B,Cin,S,Cout); //Call our module from Full_Adder_M.v

initial begin
    $dumpfile("Full_Adder_M_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,Full_Adder_M_tb);

    //Test all possible combinations for A,B and Cin
  
    for (i=0; i <=7; i=i+1)begin //Counter from 0 t0 7 

        Cin = i[0]; //Less significant bit
        B   = i[1];
        A   = i[2]; //Most significant bit
        #10;    //Wait 10nS between changes
    end 

    $display("Test completed"); //Show message in console when test is completed

end

endmodule
