`timescale 1ns / 1ps

module IterativeCounter  #(parameter vector_leght = 64)
    (
    input  wire [vector_leght-1:0] vector_in,
    output wire [$clog2(vector_leght + 1) - 1:0] count_out
    );
    
    wire [$clog2(vector_leght + 1) - 1:0] vector [vector_leght-2:0];
    
    assign count_out = vector[vector_leght-2];
    
    generate
    for (genvar i = 0; i < vector_leght - 1; i = i + 1) begin
        if (i == 0)
            assign vector[i] = vector_in[i] + vector_in[i + 1];
        else
            assign vector[i] = vector[i - 1] + vector_in[i + 1];
    end
    endgenerate
endmodule
