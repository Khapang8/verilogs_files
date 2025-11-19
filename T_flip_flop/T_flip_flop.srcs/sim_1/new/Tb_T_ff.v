`timescale 1ns / 1ps

module tb_T_flipflop;

reg T, CLK, RESET;
wire Q;

// Instantiate DUT
T_flipflop uut(
    .T(T),
    .CLK(CLK),
    .RESET(RESET),
    .Q(Q)
);

// Clock generator (10ns period)
always begin
    CLK = 0; #5;
    CLK = 1; #5;
end

initial begin
    // Initialize signals
    RESET = 1; T = 0;
    #10;

    // Release reset
    RESET = 0; T = 1;
    #40;

    T = 0;
    #20;

    T = 1;
    #40;

    $finish;
end

endmodule
