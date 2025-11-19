module counter_0_3_5_6_TFF(
    input clk,
    input reset,
    output [2:0] count
);

wire T0, T1, T2;
wire Q0, Q1, Q2;

// T input logic
assign T0 = (~Q1) & ((~Q0) | Q2);
assign T1 = 1'b1;
assign T2 = Q1;

// 3 T flip-flops
T_ff ff0(clk, reset, T0, Q0);
T_ff ff1(clk, reset, T1, Q1);
T_ff ff2(clk, reset, T2, Q2);


assign count = {Q2, Q1, Q0};

endmodule
