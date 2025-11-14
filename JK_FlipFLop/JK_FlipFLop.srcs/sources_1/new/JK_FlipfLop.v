`timescale 1ns / 1ps

module jk_flipflop(
    input  wire J,
    input  wire K,
    input  wire CLK,
    input  wire RESET,      // Active high reset
    output reg Q
);

always @(posedge CLK or posedge RESET) begin
    if (RESET)
        Q <= 1'b0;          // Reset
    else begin
        case ({J, K})
            2'b00: Q <= Q;         // No change
            2'b01: Q <= 1'b0;      // Reset
            2'b10: Q <= 1'b1;      // Set
            2'b11: Q <= ~Q;        // Toggle
        endcase
    end
end

endmodule
