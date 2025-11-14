`timescale 1ns / 1ps

module half_subtractor(
    input  wire A,
    input  wire B,
    output wire DIFF,
    output wire BORROW
);

assign DIFF   = A ^ B;      // XOR → Difference
assign BORROW = (~A) & B;   // Borrow logic

endmodule
