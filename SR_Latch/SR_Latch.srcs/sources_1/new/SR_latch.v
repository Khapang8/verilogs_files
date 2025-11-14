`timescale 1ns / 1ps

module sr_latch(
    input  wire S,   // Set
    input  wire R,   // Reset
    output wire Q,
    output wire Qbar
);

assign Q    = ~(R | Qbar);   // NOR gate
assign Qbar = ~(S | Q);      // NOR gate

endmodule
