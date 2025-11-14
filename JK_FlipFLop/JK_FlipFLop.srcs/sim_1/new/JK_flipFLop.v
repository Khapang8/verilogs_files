`timescale 1ns / 1ps

module tb_jk_flipflop();

reg J, K, CLK, RESET;
wire Q;

// Instantiate DUT
jk_flipflop uut (.J(J), .K(K), .CLK(CLK), .RESET(RESET), .Q(Q));

initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;     // 10ns clock
end

initial begin
    $monitor("Time=%0t  J=%b K=%b RESET=%b -> Q=%b", 
              $time, J, K, RESET, Q);

    RESET = 1; #10; RESET = 0;

    // No Change
    J=0; K=0; #10;

    // Reset
    J=0; K=1; #10;

    // Set
    J=1; K=0; #10;

    // Toggle
    J=1; K=1; #20;

    $stop;
end

endmodule
