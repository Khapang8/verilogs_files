`timescale 1ns/1ps

module tb_counter_0_3_5_6_TFF();

reg clk;
reg reset;
wire [2:0] count;

counter_0_3_5_6_TFF dut(
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10;
    reset = 0;

    #200;
    $stop;
end

endmodule
