`timescale 1ns / 1ps
//read from buttons/switch and display to led output, no need to connect to controller

module Segment_LED_Interface(
input logic switch0, //slect record clip, 1 or 2 J15 package pins
input logic switch1, //select play clip, 1 or 2  L16
output logic a0,
output logic a1,
output logic cathode[7:0]
    );
    
    always_comb
    begin
    if(switch0 == 1'b0)
    begin
    
    end
    
    end
endmodule
