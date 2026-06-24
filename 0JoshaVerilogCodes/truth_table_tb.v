//Truth table TestBentch
`timescale 1ns/1ns
`include "truth_table.v" //Import from wich module we are doig the testbench

module truth_table_tb();

reg  [1:0] S;      //Create registers for our inputs
wire Z_IA, Z_JM;   //Create wires for our outputs

truth_table uut (S,Z_AI,Z_JM); //Call our module from truth_table.v

initial begin
    $dumpfile("truth_table_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,truth_table_tb);

    //Test all possible combinations of the 2-bit selector S
    // S = {S[1],S[0]}
    S[0] = 0;
    S[1] = 0;
    #10;    //Wait 10nS between changes
    S[0] = 1;
    S[1] = 0;
    #10;    //Wait 10nS between changes
    S[0] = 0;
    S[1] = 1;
    #10;    //Wait 10nS between changes
    S[0] = 1;
    S[1] = 1;
    #10;    //Wait 10nS between changes

    $display("Test completed"); //Show message in console when test is completed

end

endmodule
