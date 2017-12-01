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

//wires and such
logic [4:0]qout;
logic [1:0]memoryselect_clip_1;
logic [15:0]memin;
logic [15:0]data;
logic scaledclk;
logic timerdone;
logic timer;
logic donedes;
logic doneser;
logic done;
logic audio_enable;
logic [15:0]memaddr;//address
logic [15:0]mem1out;
logic [15:0]mem2out;
logic memselect; //is this still needed?
logic block1ena;
logic block1wea;
logic block2ena;
logic block2wea;
logic channelselect;
logic pdm_clk_o;
logic deseriena;
logic seriena;

//or for done signal to address
always_comb
begin
    done = doneser||donedes;
    
end


synchronizer synchronizer( //not verified working but cmon its 2 buffer ff
.clock(clock),
.reset(reset), //button
.record(record), //button
.play(play), //button
.clipselectionwr(switch0), //switch0, rightmost switch
.clipselectionr(switch1), //switch1, second to rightmost switch
.q(qout) //5 bit output, concatination of above inputs after 2 ff
);

Controller controller( //verified working
.q(qout), //{reset,record,play,clipselectionwrite,clipselectionread}
.clock(clock),
.seconds2(timerdone), //input from timer to let controller know 2 seconds have passed
.memoryselect_clip_1(memoryselect_clip_1), //2nd bit = which block, 1st bit = read or write, write = 1, read = 0
.timer(timer) //output to run 2 second timer while on
);
    
Segment_LED_Interface LEDS( //led interface, super fucked atm
.switch0(switch0), //slect record clip, 1 or 2 J15 package pins
.switch1(switch1), //select play clip, 1 or 2  L16
.a0(a0), //rightmost led segment
.a1(a1), //second to rightmost led segment
.cathode(cathode) //7 - 0  = a-g
);

timer time2( //outputs 1 when 2 seconds have passed, verified working
.enable(timer), 
.clock(clock),
.done_signal(timerdone) //output of timer when 2 seconds have passed, passed to controller to cut off enable
);

scaledclock sclk( //converts 100 mhz clock to 1 mhz, feeds serializer, deserializer, and mic in , verified working
.clock(clock), //100 mhz clock
.enable(timer), //while timing
.scaledclk(scaledclk) //1 mhz clock output
);

Deserializer Dserial( //verified working
.clock(scaledclk), //scaled clock input
.enable(deseriena), //only deserialize when timing
.data_in(microphone), //mic in
.done(donedes), //into or gate output done to prevent contention, feeds into address creator
.data(data), //15:0 word that gets outputted
.pdm_clk_o(pdm_clk_o), //clock that is passed through from the input to feed microphone
.pdm_irsel_o(channelselect) //forced channel, mono audio lol
);

Serializer serial( //verified working
.clock(scaledclk), //scaled clk input
.enable(seriena), //only serialise when timing
.data_in(memin), //15:0 word in 
.done(doneser), //into or gate output done to prevent contention, feeds into address creator
.audio_enable(audio_enable), //pass thru of enable
.audio_data(audio_out) //bit stream out 
);    

Address_creator DS( //address creator feeds both address ins of both memories, not verified working
.clock(scaledclk), //scaled clock input to prevent multiple increases when increasing address
.done(done), //input, address only increases if this is recieved
.reset(reset),
.address(memaddr) //output 15:0 address
);


MemInterpreter MemInterpreter( //interprets the 2 bit memory input into usable enables for the memory blocks, verified working
.memoryena(memoryselect_clip_1), //2 bit input to decode
.block1ena(block1ena), //read/write enables decoded from instructions
.block1wea(block1wea),
.block2ena(block2ena),
.block2wea(block2wea),
.deseriena(deseriena),
.seriena(seriena)

);

blk_mem_gen_0 MEM1(
  .clka(done),    // clock input, toggles when done signal recieved
  .ena(block1ena),      // input wire ena, needs to be on when reading OR writing
  .wea(block1wea),      // input wire [0 : 0] wea, needs to be on when writing
  .addra(memaddr),  // input wire [15 : 0] addra
  .dina(data),    // input wire [15 : 0] dina, Data in
  .douta(mem1out)  // output wire [15 : 0] douta, Data out
);

blk_mem_gen_0 MEME2(
  .clka(done),    // clock input, toggles when done signal recieved
  .ena(block2ena),      // input wire ena
  .wea(block2wea),      // input wire [0 : 0] wea
  .addra(memaddr),  // input wire [15 : 0] addra
  .dina(data),    // input wire [15 : 0] dina
  .douta(mem2out)  // output wire [15 : 0] douta
);

twoinputmux MUX( //not verified
.mem1(mem1out), //mem 1 read feed
.mem2(mem2out), //mem 2 read feed
.memselect(block2ena), //if ~ena, then read from mem 1, else read from mem 2
.dataout(memin)
);

endmodule