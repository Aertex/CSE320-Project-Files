module Serializer #(
 parameter WORD_LENGTH = 16,
 parameter SYSTEM_FREQUENCY = 100000000,
 parameter SAMPLING_FREQUENCY = 1000000)
 
(
 input clock_i,
 input enable_i,
 //output signals
 output done_o, //Indicates that Data is sent
 input [15:0] Data_i, //Input 16-bit word
 // PWM
 output pwm_audio_o, //Output audio data
 output pwm_sdaudio_o // Output audio enable (package pin D12),keep high
);
