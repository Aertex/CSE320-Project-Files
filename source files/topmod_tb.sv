`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2017 07:09:07 PM
// Design Name: 
// Module Name: topmod_tb
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


module topmod_tb();
logic clock = 1'b0;
logic switch0;
logic switch1;
logic reset;
logic play;
logic record;
logic microphone;
logic audio_out;
logic a0;
logic a1;
logic [6:0]cathode;

TopModule TopMod(
.switch0(switch0),
.switch1(switch1),
.reset(reset),
.play(play),
.record(record),
.clock(clock),

.microphone(microphone),
.audio_out(audio_out),
.a0(a0),
.a1(a1),
.cathode(cathode)
);

always
begin 
#5 clock = ~clock;
end

always
begin
# 1microphone = 0;
#3 microphone = 1;
#2 microphone = 0;
#6 microphone = 1;
#6 microphone = 0;
end

initial 
begin
switch0 = 0;
switch1 = 0;
reset = 0;
play = 0;
record = 0;

#5
reset =1;
#25 
reset = 0;

#25
record = 1;

#100
record = 0;

#250
play = 1;

#50
play  = 0;

#100 $finish;
end

endmodule
