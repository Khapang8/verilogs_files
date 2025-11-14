`timescale 1ns / 1ps

module mux4x1(
    input  wire [3:0] I,  // Inputs I0, I1, I2, I3
    input  wire [1:0] S,  // 2-bit select
    output reg  Y
);

always @(*) begin
    case(S)
        2'b00: Y = I[0];
        2'b01: Y = I[1];
        2'b10: Y = I[2];
        2'b11: Y = I[3];
        default: Y = 1'b0;
    endcase
end

endmodule

