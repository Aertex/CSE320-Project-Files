`timescale 1ns / 1ps
//read from buttons/switch and display to led output, no need to connect to controller

// should be done plz error check
module Segment_LED_Interface(
input logic switch0, //which memory block to write to, 1 or 2 J15 package pins
input logic switch1, //which block to read from, 1 or 2  L16
input logic clock,
output logic a0,//right led
output logic a1,//left led
output logic [6:0]cathode //7 - 0  = a-g
    );
    
    always@(posedge clock)
    begin
    
    if(switch0 == 1'b0) //write led is set to write to block 1
    begin
    a0 = 1'b0;
    a1 = 1'b1;
    cathode[6:0] = 7'b100_111_1; //1
    end

    else if(switch0 == 1'b1) //write led is set to write to block 2 
    begin
    a0 = 1'b0;
    a1 = 1'b1;
    cathode[6:0] = 7'b001_001_0; //2
    end
    end
    
    always@(negedge clock)
    begin
    if(switch1 == 1'b0) //read led is set to write to block 1
    begin
    a0 = 1'b1;
    a1 = 1'b0;
    cathode[6:0] = 7'b100_111_1; //1
    end

    else if(switch1 == 1'b0) //read led is set to write to block 2
    begin
    a0 = 1'b1;
    a1 = 1'b0;
    cathode[6:0] = 7'b001_001_0; //2
    end
    end
endmodule
