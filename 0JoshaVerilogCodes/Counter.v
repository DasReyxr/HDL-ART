module Counter (Enable,Data,Load,Clk,Out,Reset,qout);

input Enable;
input [7:0] Data;
input Load;
input Clk;
input Reset;
output [7:0] Out,qout;
reg [7:0] q;
reg [7:0] Out_s;

always @(posedge Clk) begin
    if(Load == 1'b0 && Enable == 1'b1)begin
        q <= q+1;
    end
    else if (Load == 1'b1)begin
        q <= Data;
    end
    else if(Reset)begin
        q <= 8'b0;
    end
end

assign qout = q;

endmodule