module Deserializer #(
 parameter WORD_LENGTH = 16,
 parameter SYSTEM_FREQUENCY = 100000000,
 parameter SAMPLING_FREQUENCY = 1000000)
(
input clock_i, // 100 Mhz system clock
input enable_i, // Enable passed by Controller(~reset)
//output signals
output done_o, //Indicates that Data is ready
output [15:0] data_o, //Output 16-bit Word

//PDM Microphone related signals
output pdm_clk_o,
input pdm_data_i,
output pdm_lrsel_o
);
