`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 13:22:06
// Design Name: 
// Module Name: PWM
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


module PWM #(parameter max_counter = 100_000_000)
    (
    input clock,
    input reset,
    input [$clog2(max_counter + 1) - 1:0] duty,
    output pwm_out
    );
    
    localparam MAX_COUNT = $rtoi($floor($itor(max_counter))); 
    reg [$clog2(max_counter + 1) - 1:0] count = 0;

    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            count = 0;
        end else begin
            if (count == MAX_COUNT) begin
                count = 0;
            end else begin
                count = count + 1;
            end
        end
    end

    assign pwm_out = (duty >= count);
    
endmodule
