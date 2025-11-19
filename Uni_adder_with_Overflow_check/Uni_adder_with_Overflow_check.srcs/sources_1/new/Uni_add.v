`timescale 1ns / 1ps

module universal_adder(
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire M,            // Mode: 0 = Add (A+B), 1 = Sub (A-B)
    output wire [3:0] S,      // Sum / Difference
    output wire Cout,         // Final Carry out
    output wire Overflow      // Signed overflow flag
);

wire [3:0] B_eff;   // Effective B after XOR with M
wire c0, c1, c2, c3; // Internal carries

// If M=0 → B_eff = B (add)
// If M=1 → B_eff = ~B (for A + ~B + 1 = A-B)
assign B_eff = B ^ {4{M}};

// Ripple-carry addition
assign {c0, S[0]} = A[0] + B_eff[0] + M;    // LSB, Cin = M
assign {c1, S[1]} = A[1] + B_eff[1] + c0;
assign {c2, S[2]} = A[2] + B_eff[2] + c1;
assign {Cout, S[3]} = A[3] + B_eff[3] + c2;

// Signed overflow = carry into MSB XOR carry out of MSB
assign Overflow = c2 ^ Cout;

endmodule
