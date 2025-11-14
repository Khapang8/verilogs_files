`timescale 1ns / 1ps

module tb_subtractor4();

reg [3:0] A, B;
wire [3:0] DIFF;
wire Borrow;

subtractor4 uut (.A(A), .B(B), .DIFF(DIFF), .Borrow(Borrow));

initial begin
    $monitor("A=%b  B=%b -> DIFF=%b  Borrow=%b",
              A, B, DIFF, Borrow);

    A=4'b1001; B=4'b0011; #10;   // 9 - 3
    A=4'b0111; B=4'b0001; #10;   // 7 - 1
    A=4'b0100; B=4'b1000; #10;   // 4 - 8 (borrow)

    $stop;
end

endmodule
