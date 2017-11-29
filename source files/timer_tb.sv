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
logic clock = 1'b0;
logic scaledclk; 
logic enable;
logic [6:0]counter;

scaledclock clk(
.clock(clock),
.counter(counter),
.scaledclk(scaledclk),
.enable(enable)
);

always #5 clock = ~clock;

initial 
begin
enable = 0;

#15
enable = 1;

#1000000000
enable = 0;
#100 $finish;
end
endmodule
