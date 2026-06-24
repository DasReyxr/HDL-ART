module multiplexed_register (Data,Select,Read,Out);

    input  [3:0] Data;
    input  [2:0] Select;
    input  [2:0] Read;
    output [3:0] Out;
    reg   [3:0] Clk;
    reg   [3:0] Reg_0, Reg_1, Reg_2, Reg_3;

    always @(*) begin
      case(Select)
        2'b00:   Clk = 4'b0001;
        2'b01:   Clk = 4'b0010;
        2'b10:   Clk = 4'b0100;
        2'b11:   Clk = 4'b1000;
        default: Clk = 4'bxxxx;
        endcase  
    end
    
    always @(posedge Clk[0]) begin
        Reg_0 <= Data;
    end

    always @(posedge Clk[1]) begin
        Reg_1 <= Data;
    end

    always @(posedge Clk[2]) begin
        Reg_2 <= Data;
    end

    always @(posedge Clk[3]) begin
        Reg_3 <= Data;
    end
    
    assign Out = Read[1] ? (Read[0] ? Reg_3 : Reg_2)
                         : (Read[0] ? Reg_1 : Reg_0);

endmodule