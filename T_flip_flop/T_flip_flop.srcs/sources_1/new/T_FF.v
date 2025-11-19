module T_flipflop(
    input  wire T,
    input  wire CLK,
    input  wire RESET,
    output reg  Q
);

always @(posedge CLK or posedge RESET) begin
    if (RESET)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;
    else
        Q <= Q;
end

endmodule
