`timescale 1ns / 1ps

//just holds container, 
module TopModule(
input logic switch0,
input logic switch1,
input logic reset,
input logic play,
input logic record,
input logic microphone,
output logic audio_out,
output logic a0,
output logic a1,
output logic [6:0]cathode

    );
endmodule

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
blk_mem_gen_0 your_instance_name (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [15 : 0] addra
  .dina(dina),    // input wire [15 : 0] dina
  .clkb(clkb),    // input wire clkb
  .enb(enb),      // input wire enb
  .addrb(addrb),  // input wire [15 : 0] addrb
  .doutb(doutb)  // output wire [15 : 0] doutb
);