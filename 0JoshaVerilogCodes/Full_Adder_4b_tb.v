//Full_Adder_4b TestBentch
`timescale 1ns/1ns
`include "Full_Adder_4b.v" //Import from wich module we are doig the testbench

module Full_Adder_4b_tb();

integer i; //Varaiable for counting
integer A_var,B_var; //Variables for input combinations
reg [4:0] result; //Variable to store expected result
reg  [3:0]A,B;  //Create registers for our inputs
wire [4:0]S;   //Create wires for our outputs

Full_Adder_4b uut (A,B,S); //Call our module from Full_Adder_M.v

initial begin
    $dumpfile("Full_Adder_4b_tb.vcd"); //Create the file that will give us the waveform of our output
    $dumpvars(0,Full_Adder_4b_tb);

    //Test 10 random cases for the Adder
  
    for (A_var = 0; A_var < 16; A_var = A_var + 1)begin //Counter for all values for A
        for (B_var = 0; B_var < 16; B_var = B_var + 1)begin //Counter for all values for B
            result = A_var + B_var; //Expected result
            A = A_var; //Assign value to A
            B = B_var; //Assign value to B
            #10; //Wait 10 time units

            if (S !== result) begin //Compare expected result with output from the module
                $display("Test failed for A = %d, B = %d ---> Expected S = %d, got S = %d", A, B, result, S);
            end else begin
                $display("Test passed for A = %d, B = %d ---> S = %d", A, B, S);
            end
         end
    end

    $display("Test completed"); //Show message in console when test is completed
    $finish; //End the simulation

end

endmodule
