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
input logic enable,
output logic scaledclk 
);

logic [6:0]counter = 7'd0;

always_ff@(posedge clock)
begin 
if((counter == 7'd49))
    counter <= 7'd0;
if(enable == 0)
    scaledclk = 0;

else
    begin
           counter <= counter + 1'b1;
    end
end

always_ff@(posedge clock)
    if(counter == 7'd49)
        begin
        //toggle clock and reset counter
            scaledclk <= ~scaledclk;
            counter <= 7'b0;
        end

    
endmodule
