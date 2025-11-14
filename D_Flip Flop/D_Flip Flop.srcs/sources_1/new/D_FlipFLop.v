`timescale 1ns / 1ps

module d_flipflop(
    input  wire D,
    input  wire CLK,
    input  wire RESET,      // Active-high reset
    output reg Q
);

always @(posedge CLK or posedge RESET) begin
    if (RESET)
        Q <= 1'b0;          // Reset output
    else
        Q <= D;             // Store the input
end

endmodule
