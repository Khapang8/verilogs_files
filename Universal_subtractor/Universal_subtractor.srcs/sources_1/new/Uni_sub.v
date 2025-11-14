`timescale 1ns / 1ps

module subtractor4(
    input  wire [3:0] A,
    input  wire [3:0] B,
    output wire [3:0] DIFF,
    output wire Borrow
);

wire [3:0] B_comp; // B'
assign B_comp = ~B;

wire c1, c2, c3;

// Add A + B' + 1
full_adder FA0(A[0], B_comp[0], 1'b1, DIFF[0], c1);
full_adder FA1(A[1], B_comp[1], c1,    DIFF[1], c2);
full_adder FA2(A[2], B_comp[2], c2,    DIFF[2], c3);
full_adder FA3(A[3], B_comp[3], c3,    DIFF[3], Borrow);

endmodule

// Full Adder Module
module full_adder(
    input A, B, Cin,
    output SUM, Cout
);

assign SUM  = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
