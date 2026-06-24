//twoin_gates TestBentch
`timescale 1ns/1ns
`include "twoin_gates.v" //Import from wich module we are doig the testbench

module twoin_gates_tb();

reg  A,B;      //Create registers for our inputs
wire [6:0] Z;   //Create wires for our outputs

twoin_gates uut (A,B,Z); //Call our module from twoin_gates.v

initial begin
    $dumpfile("twoin_gates_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,twoin_gates_tb);

    //Test all possible combinations for A and B
    A = 0;
    B = 0;
    #10;    //Wait 10nS between changes
    A = 0;
    B = 1;
    #10;    //Wait 10nS between changes
    A = 1;
    B = 0;
    #10;    //Wait 10nS between changes
    A = 1;
    B = 1;
    #10;    //Wait 10nS between changes

    $display("Test completed"); //Show message in console when test is completed

end

endmodule
