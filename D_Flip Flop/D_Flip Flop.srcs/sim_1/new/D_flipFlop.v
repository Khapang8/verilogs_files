`timescale 1ns / 1ps

module tb_d_flipflop();

reg D, CLK, RESET;
wire Q;

d_flipflop uut (.D(D), .CLK(CLK), .RESET(RESET), .Q(Q));

initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;  // Generate 10ns clock
end

initial begin
    $monitor("Time=%0t  D=%b RESET=%b Q=%b", $time, D, RESET, Q);

    RESET = 1; D = 0; #10;  // Reset active
    RESET = 0;

    D = 1; #10;
    D = 0; #10;
    D = 1; #10;

    RESET = 1; #10;         // Reset again
    RESET = 0; #10;

    $stop;
end

endmodule
