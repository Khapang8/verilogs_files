`timescale 1ns / 1ps

module half_adder(
    input  wire A,
    input  wire B,
    output wire SUM,
    output wire CARRY
);

assign SUM   = A ^ B;   // XOR
assign CARRY = A & B;   // AND

endmodule

