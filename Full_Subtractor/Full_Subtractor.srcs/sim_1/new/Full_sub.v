`timescale 1ns / 1ps

module tb_full_subtractor();

reg A, B, Bin;
wire DIFF, Bout;

// Instantiate the DUT
full_subtractor uut (
    .A(A),
    .B(B),
    .Bin(Bin),
    .DIFF(DIFF),
    .Bout(Bout)
);

initial begin
    $monitor("Time=%0t  A=%b B=%b Bin=%b  -> DIFF=%b Bout=%b",
              $time, A, B, Bin, DIFF, Bout);

    // All 8 combinations
    A=0; B=0; Bin=0; #10;
    A=0; B=0; Bin=1; #10;
    A=0; B=1; Bin=0; #10;
    A=0; B=1; Bin=1; #10;

    A=1; B=0; Bin=0; #10;
    A=1; B=0; Bin=1; #10;
    A=1; B=1; Bin=0; #10;
    A=1; B=1; Bin=1; #10;

    $stop;
end

endmodule
