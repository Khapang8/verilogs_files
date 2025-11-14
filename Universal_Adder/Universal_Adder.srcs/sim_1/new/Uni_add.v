`timescale 1ns / 1ps

module tb_adder4();

reg [3:0] A, B;
reg Cin;
wire [3:0] SUM;
wire Cout;

adder4 uut (.A(A), .B(B), .Cin(Cin), .SUM(SUM), .Cout(Cout));

initial begin
    $monitor("A=%b  B=%b  Cin=%b -> SUM=%b  Cout=%b", 
              A, B, Cin, SUM, Cout);

    A=4'b0011; B=4'b0101; Cin=0; #10;   // 3 + 5
    A=4'b1111; B=4'b0001; Cin=0; #10;   // 15 + 1
    A=4'b1010; B=4'b0110; Cin=1; #10;   // 10 + 6 + 1

    $stop;
end

endmodule
