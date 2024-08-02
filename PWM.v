`timescale 1ns / 1ps

module PWM #(parameter max_counter = 100_000_000)
    (
    input clock,
    input reset,
    input [$clog2(max_counter + 1) - 1:0] duty,
    output pwm_out
    );
    
    localparam MAX_COUNT = $rtoi($floor($itor(max_counter))); 
    reg [$clog2(max_counter + 1) - 1:0] count = 0;

    always @(posedge clock) begin
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
