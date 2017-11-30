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
//addresses from address creator to memory
logic addressM1[15:0];
logic addressM2[15:0];

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

blk_mem_gen_0 mem1 (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [15 : 0] addra
  .dina(dina),    // input wire [15 : 0] dina
  .douta(douta)  // output wire [15 : 0] douta
);

blk_mem_gen_0 mem2(
    .clka(clka),    // input wire clka
    .ena(ena),      // input wire ena
    .wea(wea),      // input wire [0 : 0] wea
    .addra(addra),  // input wire [15 : 0] addra
    .dina(dina),    // input wire [15 : 0] dina
    .douta(douta)  // output wire [15 : 0] douta
  );

endmodule