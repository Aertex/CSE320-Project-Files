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
logic ssdf;

scaledclock clk(
.clock(clock),
.scaledclk(scaledclk)
);

always #5 clock = ~clock;

initial 
begin



#1000000000000
ssdf = 1;
#100 $finish;
end
endmodule
