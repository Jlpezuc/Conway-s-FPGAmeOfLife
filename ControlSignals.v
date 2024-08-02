`timescale 1ns / 1ps

module ControlSignals(
    input [31:0] gpio_ch1,
    input [31:0] gpio_ch2,
    output enable,
    output reset,
    output white,
    output [31:0] divisor
    );
    
    assign enable  = gpio_ch1[0];
    assign reset   = gpio_ch1[1];
    assign white   = gpio_ch1[2];
    assign divisor = gpio_ch2;
endmodule
