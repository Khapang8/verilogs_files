`timescale 1ns / 1ps

module universal_adder_tb;

reg  [3:0] A;
reg  [3:0] B;
reg  M;                  // Mode: 0 = Add, 1 = Sub
wire [3:0] S;
wire Cout;
wire Overflow;

// Instantiate DUT (Device Under Test)
universal_adder uut (
    .A(A),
    .B(B),
    .M(M),
    .S(S),
    .Cout(Cout),
    .Overflow(Overflow)
);

initial begin
    $display("Time\tM\tA\tB\t|\tS\tCout\tOvflw");
    $monitor("%0t\t%b\t%4b\t%4b\t|\t%4b\t%b\t%b",
              $time, M, A, B, S, Cout, Overflow);

    // Test 1: 5 + 3 = 8 (no overflow)
    M = 0; A = 4'b0101; B = 4'b0011;
    #10;

    // Test 2: 7 + 3 = 10 (0111 + 0011 = 1010) → signed overflow
    M = 0; A = 4'b0111; B = 4'b0011;
    #10;

    // Test 3: 5 - 2 = 3
    M = 1; A = 4'b0101; B = 4'b0010;
    #10;

    // Test 4: -8 (-1000) - 1 (0001) → overflow in signed
    M = 1; A = 4'b1000; B = 4'b0001;
    #10;

    // Test 5: -4 (-0100) + -5 (-0101) → overflow
    M = 0; A = 4'b1100; B = 4'b1011;
    #10;

    $finish;
end

endmodule
