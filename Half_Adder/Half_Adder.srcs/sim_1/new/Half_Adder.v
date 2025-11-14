`timescale 1ns / 1ps

module tb_half_adder();

// Test signals
reg A, B;
wire SUM, CARRY;

// Instantiate DUT
half_adder uut (
    .A(A),
    .B(B),
    .SUM(SUM),
    .CARRY(CARRY)
);

initial begin
    $monitor("Time=%0t A=%b B=%b -> SUM=%b CARRY=%b", 
              $time, A, B, SUM, CARRY);

    // Apply all input combinations
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $stop;
end

endmodule
