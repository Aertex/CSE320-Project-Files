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