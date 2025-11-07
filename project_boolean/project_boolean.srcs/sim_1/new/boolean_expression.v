`timescale 1ns / 1ps

module tb_boolean_exp();
    reg A, B, C;
    wire Y;

    // Instantiate the DUT (Device Under Test)
    boolean_exp uut (
        .A(A), .B(B), .C(C), .Y(Y)
    );

    initial begin
        $display("A B C | Y");
        $monitor("%b %b %b | %b", A, B, C, Y);

        // Apply all possible combinations
        A=0; B=0; C=0; #10;
        A=0; B=0; C=1; #10;
        A=0; B=1; C=0; #10;
        A=0; B=1; C=1; #10;
        A=1; B=0; C=0; #10;
        A=1; B=0; C=1; #10;
        A=1; B=1; C=0; #10;
        A=1; B=1; C=1; #10;

        $stop;
    end
endmodule

