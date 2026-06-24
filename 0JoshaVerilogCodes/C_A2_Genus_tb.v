//COMPLEMENTO A 2TestBench
`timescale 1ns/1ns
`include "C_A2_Genus.v" //Importamos el archivo al cual le hacemos su testbench

module C_A2_Genus_tb ();

    reg  [3:0] In;
    reg Enable;
    wire [3:0] Out;
    

C_A2_Genus uut(In,Enable,Out);

initial begin

    $dumpfile("C_A2_Genus_tb.vcd"); //Creamos el archivo que nos dara la señal de onda de nuestra salida
    $dumpvars(0,C_A2_Genus_tb);
    $display("A");
    Enable = 0;
    In = 4'b0110;
    #20
    Enable = 1;
    #20
    $display("Test completed");

end

endmodule