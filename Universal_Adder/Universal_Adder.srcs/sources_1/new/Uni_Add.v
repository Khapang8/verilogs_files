`timescale 1ns / 1ps

module adder4(
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire Cin,
    output wire [3:0] SUM,
    output wire Cout
);

wire c1, c2, c3;

// Ripple carry full adders
full_adder FA0(A[0], B[0], Cin, SUM[0], c1);
full_adder FA1(A[1], B[1], c1,  SUM[1], c2);
full_adder FA2(A[2], B[2], c2,  SUM[2], c3);
full_adder FA3(A[3], B[3], c3,  SUM[3], Cout);

endmodule

// Full Adder Module
module full_adder(
    input A, B, Cin,
    output SUM, Cout
);

assign SUM  = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
