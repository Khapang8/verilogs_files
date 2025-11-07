`timescale 1ns / 1ps

module priority_encoder_4to2(
    input [3:0] I,    // Inputs (I3 highest priority)
    output reg [1:0] Y,
    output reg valid  // Indicates if any input is active
    );

    always @(*) begin
        if (I[3]) begin
            Y = 2'b11; valid = 1;
        end else if (I[2]) begin
            Y = 2'b10; valid = 1;
        end else if (I[1]) begin
            Y = 2'b01; valid = 1;
        end else if (I[0]) begin
            Y = 2'b00; valid = 1;
        end else begin
            Y = 2'b00; valid = 0;
        end
    end

endmodule
