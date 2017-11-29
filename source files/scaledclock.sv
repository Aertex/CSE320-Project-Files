`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 04:46:18 PM
// Design Name: 
// Module Name: scaledclock
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


module scaledclock(
input logic clock,
output scaledclk 
);
logic counter;
always@(posedge clock)
begin 
if((counter == 1'd99)||(enable == 1'b0))
    counter <= 28'd000_000_000;

else
    begin
           counter <= counter + 1'b1;
           done_signal = 0;
    end
end

always@(posedge clock)
    if(counter == 28'd199_999_999)
        begin
            done_signal <= ~ done_signal;
        end

    
endmodule
