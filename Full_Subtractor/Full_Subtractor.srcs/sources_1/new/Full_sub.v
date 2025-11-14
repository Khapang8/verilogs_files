`timescale 1ns / 1ps

module full_subtractor(
    input  wire A,        // Minuend
    input  wire B,        // Subtrahend
    input  wire Bin,      // Borrow-in
    output wire DIFF,     // Difference
    output wire Bout      // Borrow-out
);

// Difference = A ⊕ B ⊕ Bin
assign DIFF = A ^ B ^ Bin;

// Borrow-out logic:
// Bout = (~A & B) | ((~A | B) & Bin)
assign Bout = (~A & B) | ((~A | B) & Bin);

endmodule
