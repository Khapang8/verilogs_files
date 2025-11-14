`timescale 1ns / 1ps

module tb_full_adder();

reg A, B, Cin;
wire SUM, Cout;

// Instantiate DUT
full_adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .SUM(SUM),
    .Cout(Cout)
);

initial begin
    $monitor("Time=%0t  A=%b B=%b Cin=%b -> SUM=%b Cout=%b",
              $time, A, B, Cin, SUM, Cout);

    // Test all 8 combinations
    A=0; B=0; Cin=0; #10;
    A=0; B=0; Cin=1; #10;
    A=0; B=1; Cin=0; #10;
    A=0; B=1; Cin=1; #10;

    A=1; B=0; Cin=0; #10;
    A=1; B=0; Cin=1; #10;
    A=1; B=1; Cin=0; #10;
    A=1; B=1; Cin=1; #10;

    $stop;
end

endmodule
