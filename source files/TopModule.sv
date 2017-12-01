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

logic [4:0]qout;
logic [1:0]memoryselect_clip_1;

synchronizer synchronizer(
.clock(clock),
.reset(reset),
.record(record),
.play(play),
.clipselectionwr(switch0),
.clipselectionr(switch1),
.q(qout)
);

Controller controller(
.q(qout), //{reset,record,play,clipselectionwrite,clipselectionread}
.clock(clock),
.seconds2(timerdone), //input from timer to let controller know 2 seconds have passed
.memoryselect_clip_1(memoryselect_clip_1), //2nd bit = which block, 1st bit = read or write, write = 1, read = 0
.timer(timer)
);

MemInterpreter MemInterpreter(
.memoryena(memoryselect_clip_1),
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
.enable(timer),
.clock(clock),
.done_signal(timerdone) //output of timer when 2 seconds have passed, passed to controller to cut off enable
);

scaledclock sclk(
.clock(clock),
.enable(timer),
.scaledclk(scaledclk) 
);

Deserializer Dserial(
.clock(scaledclk),
.enable(timer),
.data_in(microphone),
.done(done),
.data(data),
.pdm_clk_o(pdm_clk_o), 
.pdm_irsel_o(pdm_irsel_o) 
);

Serializer serial(

.clock(scaledclk),
.enable(timer),
.data_in(MEMORY),
.done(done),
.audio_enable(audio_out),
.audio_data(audio_data)
);    

Address_creator DS(
.clock(clock), //input
.done(done), //input
.reset(reset),
.address(addressM1) //output
);

Address_creator S(
.clock(clock), //input
.done(done), //input
.reset(reset),
.address(addressM2) //output
);

endmodule