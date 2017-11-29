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
output logic scaledclk 
);
logic [6:0]counter;
always@(posedge clock)
begin 
if((counter == 7'd99))
    counter <= 7'd0;

else
    begin
           counter <= counter + 1'b1;
    end
end

always@(posedge clock)
    if(counter == 7'd99)
        begin
            scaledclk <= ~scaledclk;
        end

    
endmodule
