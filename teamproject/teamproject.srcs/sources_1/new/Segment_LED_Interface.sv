`timescale 1ns / 1ps
//read from buttons/switch and display to led output, no need to connect to controller

// should be done plz error check
module Segment_LED_Interface(
input logic switch0, //slect record clip, 1 or 2 J15 package pins
input logic switch1, //select play clip, 1 or 2  L16
output logic a0,
output logic a1,
output logic [6:0]cathode //7 - 0  = a-g
    );
    
    always_comb
    begin
    
    if(switch0 == 1'b0)
    begin
    a0 = 1'b0;
    a1 = 1'b1;
    cathode[6:0] = 7'b100_111_1; //1
    end
    
    if(switch0 == 1'b1)
    begin
    a0 = 1'b0;
    a1 = 1'b1;
    cathode[6:0] = 7'b001_001_0; //2
    end
    
    
    if(switch1 == 1'b0)
    begin
    a0 = 1'b0;
    a1 = 1'b1;
    cathode[6:0] = 7'b100_111_1; //1
    end
    
    if(switch1 == 1'b0)
    begin
    a0 = 1'b0;
    a1 = 1'b1;
    cathode[6:0] = 7'b001_001_0; //2
    end
    end
endmodule
