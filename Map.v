`timescale 1ns / 1ps

module Map #(parameter map_width = 8)
    (
    input wire clock,
    input wire enable,
    input wire reset,
    input wire [map_width**2-1:0] state_in,
    output reg [map_width**2-1:0] state_out
    );
    
    always @(posedge clock or posedge reset) begin
        if (reset)
            state_out <= 0;
        else if (enable)
            state_out <= state_in;
    end
endmodule
