`timescale 1ns / 1ps

module tb_sr_latch();

reg S, R;
wire Q, Qbar;

// Instantiate DUT
sr_latch uut (
    .S(S),
    .R(R),
    .Q(Q),
    .Qbar(Qbar)
);

initial begin
    $monitor("Time=%0t  S=%b  R=%b  ->  Q=%b  Qbar=%b",
              $time, S, R, Q, Qbar);

    // Initial condition (Hold)
    S = 0; R = 0; #10;

    // Set = 1
    S = 1; R = 0; #10;

    // Back to Hold
    S = 0; R = 0; #10;

    // Reset = 1
    S = 0; R = 1; #10;

    // Back to Hold
    S = 0; R = 0; #10;

    // Forbidden condition
    S = 1; R = 1; #10;

    $stop;
end

endmodule
