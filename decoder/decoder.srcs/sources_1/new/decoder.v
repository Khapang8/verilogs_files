`timescale 1ns / 1ps

module decoder_2to4(
    input [1:0] A,   // 2-bit input
    input EN,        // Enable signal
    output [3:0] Y   // 4 outputs
    );

    assign Y[0] = EN & (~A[1]) & (~A[0]);
    assign Y[1] = EN & (~A[1]) &  (A[0]);
    assign Y[2] = EN &  (A[1]) & (~A[0]);
    assign Y[3] = EN &  (A[1]) &  (A[0]);

endmodule
