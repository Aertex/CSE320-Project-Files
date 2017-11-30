`timescale 1ns / 1ps

//just holds container, 
module TopModule(
input logic switch0,
input logic switch1, 
input logic reset,
input logic play,
input logic record,
input logic clock,


input logic microphone,
output logic audio_out,

output logic a0,
output logic a1,
output logic [6:0]cathode

);

synchronizer synchronizer(
.clock(clock),
.reset(reset),
.record(record),
.play(play),
.clipselectionwr(switch0),
.clipselectionr(switch1),
.q(q)
);

Controller controller(
.q(q), //{reset,record,play,clipselectionwrite,clipselectionread}
.clock(clock),
.seconds2(seconds2), //input from timer to let controller know 2 seconds have passed
.memoryselect_clip_1(memoryselect_clip_1), //2nd bit = which block, 1st bit = read or write, write = 1, read = 0
.timer(timer)
);

MemInterpreter MemInterpreter(
.memoryena(memoryena),
.block1ena(block1ena),
.block1wea(block1wea),
.block2ena(block2ena),
.block2wea(block2wea)
);
    
Segment_LED_Interface LEDS(
.switch0(switch0), //slect record clip, 1 or 2 J15 package pins
.switch1(switch1), //select play clip, 1 or 2  L16
.a0(a0),
.a1(a1),
.cathode(cathode) //7 - 0  = a-g
);

timer time2(
.enable(enable),
.clock(clock),
.done_signal(done_signal) //output of timer when 2 seconds have passed, passed to controller to cut off enable
);

scaledclock sclk(
.clock(clock),
.enable(enable),
.scaledclk(scaledclk) 
);

Deserializer Dserial(
.clock(clock),
.enable(enable),
.data_in(data_in),
.done(done),
.data(data),
.pdm_clk_o(pdm_clk_o), 
.pdm_irsel_o(pdm_irsel_o) 
);

Serializer serial(

.clock(clock),
.enable(enable),
.data_in(data_in),
.done(done),
.audio_enable(audio_enable),
.audio_data(audio_data)
);    

Address_creator M1(
.clock(clock), //input
.done(done), //input
.address(addressM1) //output
);

Address_creator M2(
.clock(clock), //input
.done(done), //input
.address(addressM2) //output
);

endmodule