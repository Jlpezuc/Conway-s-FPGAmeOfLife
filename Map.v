`timescale 1ns / 1ps

module Map #(parameter map_width = 8, parameter map_height = 8)
    (
    input clock,
    input enable,
    input reset,
    input [map_width*map_height-1:0] state_in,
    input [map_width*map_height-1:0] state_init,
    output reg [map_width*map_height-1:0] state_out
    );
    
    reg init = 1;
    
    always @(posedge clock) begin
        if (!reset) begin
            state_out <= 0;
            init <= 1;
        end else if (enable) begin
            if (init)
                state_out <= state_init;
            else
                state_out <= state_in;
            init <= 0;
        end
    end
endmodule

