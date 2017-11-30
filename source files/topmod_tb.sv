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

always #5 clock = ~clock;


initial 
begin
switch0 = 0;
switch1 = 0;
#100 $finish;
end

endmodule
