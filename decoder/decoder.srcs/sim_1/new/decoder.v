`timescale 1ns / 1ps

module tb_decoder_2to4();
    reg [1:0] A;     // Input lines
    reg EN;          // Enable input
    wire [3:0] Y;    // Output lines

    // Instantiate the Decoder
    decoder_2to4 uut (
        .A(A),
        .EN(EN),
        .Y(Y)
    );

    initial begin
        $display("Time | EN A1 A0 | Y3 Y2 Y1 Y0");
        $monitor("%4t |  %b  %b  %b  |  %b  %b  %b  %b",
                  $time, EN, A[1], A[0], Y[3], Y[2], Y[1], Y[0]);

        // Enable decoder
        EN = 1;

        // Apply all input combinations
        A = 2'b00; #10;
        A = 2'b01; #10;
        A = 2'b10; #10;
        A = 2'b11; #10;

        // Disable decoder and test again
        EN = 0; A = 2'b10; #10;

        $stop;  // End simulation
    end
endmodule
