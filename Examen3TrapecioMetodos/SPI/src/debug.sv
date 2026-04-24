module counter(clk,trigger, A, B);
input clk, A;
output reg trigger, B;

reg [7:0] count;
//reg trigger = 1'b0;

localparam TRIG = 0;

// count process 
always @(posedge clk) begin
count = count +1; 
// trigger  
    if(count == TRIG) 
    begin
    trigger = 1'b1;
    end 
    else begin
    trigger = 1'b0;
    end 

end
always @* begin
    B = A;
end

endmodule