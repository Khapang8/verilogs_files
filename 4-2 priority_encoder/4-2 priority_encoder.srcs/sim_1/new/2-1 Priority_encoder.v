`timescale 1ns / 1ps

module tb_priority_encoder_4to2();
    reg [3:0] I;
    wire [1:0] Y;
    wire valid;

    priority_encoder_4to2 uut (
        .I(I),
        .Y(Y),
        .valid(valid)
    );

    initial begin
        $display("I | Y | valid");
        I = 4'b0000; #10;
        I = 4'b0001; #10;
        I = 4'b0010; #10;
        I = 4'b0100; #10;
        I = 4'b1000; #10;
        I = 4'b1100; #10;
        I = 4'b0110; #10;
        I = 4'b1010; #10;

        $stop;
    end
endmodule
