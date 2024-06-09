`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 12:50:47
// Design Name: 
// Module Name: RGBDriver
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


module RGBDriver #(parameter map_width = 8,
                   parameter map_height = 8,
                   parameter clock_frequency = 100_000_000,
                   parameter pwm_frequency = 1_000)
    (
    input clock,
    input reset,
    input white,
    input [map_width * map_height - 1:0] state_in,
    output [2:0] rgb_out
    );
    
    localparam max_count = map_width * map_height; 
    
    localparam divisor = $rtoi($floor($itor(clock_frequency) / $itor(max_count * pwm_frequency * 10))); 
    
    wire [$clog2(max_count + 1) - 1 : 0] count;
    
    wire pwm_out;
    
    wire clock_divided;
    
    IterativeCounter #(.vector_leght(max_count)) counter_inst (
        .vector_in(state_in),
        .count_out(count)
    );
    
    ClockDivider #(.divisor(divisor)) clock_divider_inst (
        .reset(reset),
        .clock_in(clock),
        .clock_out(clock_divided)
    );
    
    PWM #(.max_counter(max_count)) pwm_inst (
        .clock(clock_divided),
        .reset(reset),
        .duty(count),
        .pwm_out(pwm_out)
    );
    
    assign rgb_out[0] = white ? pwm_out : ~pwm_out;
    assign rgb_out[1] = white ? pwm_out : pwm_out;
    assign rgb_out[2] = white ? pwm_out : 0;
    
endmodule
