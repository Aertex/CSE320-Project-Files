`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 03:37:08 PM
// Design Name: 
// Module Name: timer_tb
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
module timer_tb();

logic clock;
logic enable;
logic [15:0]data_in;
logic done;
logic audio_data;




Serializer ser(
.clock(clock),
.enable(enable),
.data_in(data_in),
.done(done),
.audio_data(audio_data),
.audio_enable(audio_enable)
);


always #10 clock = ~clock;


initial 
begin
enable = 1;
data_in = 16'b1000_0000_0000_0001;
clock = 0;



#1000000000
enable = 0;
#100 $finish;
end
endmodule
