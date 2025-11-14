`timescale 1ns / 1ps

module tb_half_subtractor();

reg A, B;
wire DIFF, BORROW;

// Instantiate the DUT
half_subtractor uut (
    .A(A),
    .B(B),
    .DIFF(DIFF),
    .BORROW(BORROW)
);

initial begin
    $monitor("Time=%0t  A=%b  B=%b  -> DIFF=%b  BORROW=%b",
              $time, A, B, DIFF, BORROW);

    // All possible input combinations
    A = 0; B = 0; #10;
    A = 0; B = 1; #10; // Borrow should be 1
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $stop;
end

endmodule
