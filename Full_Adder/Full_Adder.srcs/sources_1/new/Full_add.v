`timescale 1ns / 1ps

module full_adder(
    input  wire A,
    input  wire B,
    input  wire Cin,      // Carry in
    output wire SUM,
    output wire Cout      // Carry out
);

// SUM = A ⊕ B ⊕ Cin
assign SUM = A ^ B ^ Cin;

// CARRY = (A & B) | (Cin & (A ^ B))
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
