module register (Data,Select,Read,Out,Clk);

    input  [3:0] Data;
    input  [1:0] Select;
    input  [1:0] Read;
    output [3:0] Out;
    input Clk;
    reg   [3:0] Reg_0, Reg_1, Reg_2, Reg_3;

  always @(posedge Clk) begin
    if (Select == 2'b00) begin
        Reg_0 <= Data;
    end 
    else if (Select == 2'b01) begin
        Reg_1 <= Data;
    end 
    else if (Select == 2'b10) begin
        Reg_2 <= Data;
    end 
    else if (Select == 2'b11) begin
        Reg_3 <= Data;
    end
end

assign Out = Read[1] ? (Read[0] ? Reg_3 : Reg_2)
                     : (Read[0] ? Reg_1 : Reg_0);
        

endmodule