`timescale 1ns / 1ps

module tb_mux4x1();

reg  [3:0] I;
reg  [1:0] S;
wire Y;

mux4x1 uut (
    .I(I),
    .S(S),
    .Y(Y)
);

initial begin
    $monitor("Time=%0t  I=%b  S=%b  => Y=%b", $time, I, S, Y);

    I = 4'b1010;

    S = 2'b00; #10;
    S = 2'b01; #10;
    S = 2'b10; #10;
    S = 2'b11; #10;

    $stop;
end

endmodule

