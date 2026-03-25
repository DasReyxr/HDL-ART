`timescale 1ns/1ps

module simple_counter_tb;
    reg clk;
    reg rst;
    wire [3:0] q;

    integer i;

    simple_counter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, simple_counter_tb);

        rst = 1'b1;
        #12;
        rst = 1'b0;

        for (i = 0; i < 20; i = i + 1) begin
            @(posedge clk);
            #1;
            $display("t=%0t q=%0d", $time, q);
        end

        $finish;
    end
endmodule
