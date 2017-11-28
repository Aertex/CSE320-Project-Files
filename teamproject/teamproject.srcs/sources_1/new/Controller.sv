//main driver, controlls everything
//use created memory, datainA will be writing in, datainB will be reading out
module Controller(
input logic play,
input logic record,
input logic reset,
input logic play_select,
input logic record_select,

input logic seconds2, //input from timer to let controller know 2 seconds have passed

output logic [1:0]memoryselect_clip_1, //2rd bit = write enable, 1nd bit = enable for memory reading/writing
output logic [1:0]memoryselect_clip_2 //2rd bit = write enable, 1nd bit = enable for memory reading/writing

);


endmodule