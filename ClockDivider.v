`timescale 1ns / 1ps

module ClockDivider
    (
    input reset,
    input clock_in,
    input divisor,
    output clock_out
    );
    
    reg [31:0] count = 0;
    
    assign clock_out = (count > divisor / 2) ? 1 : 0;
    
    always @(posedge clock_in) begin
        if (!reset) begin
            count <= 0;
        end else begin
            count <= count + 1;
            if (count >= divisor - 1) begin
                count <= 0;
            end
        end
    end
endmodule
