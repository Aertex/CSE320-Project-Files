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
logic enable;

logic clock = 1'b0;
logic done_signal;

timer time1(
.enable(enable),
.clock(clock),
.done_signal(done_signal)
);

always #5 clock = ~clock;

initial 
begin
enable = 0;


#10
enable = 1;

#100000000000000000000000
#100 $finish;
end
endmodule
