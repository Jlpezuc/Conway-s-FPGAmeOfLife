`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 20:37:01
// Design Name: 
// Module Name: ClockDivider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ClockDivider#(parameter divisor = 2)
    (
    input reset,
    input clock_in,
    output clock_out
    );
    
    reg [$clog2(divisor + 1) - 1:0] count = 0;
    
    assign clock_out = (count > divisor / 2) ? 1 : 0;
    
    always @(posedge clock_in or negedge reset) begin
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
