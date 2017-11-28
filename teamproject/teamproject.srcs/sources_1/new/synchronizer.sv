`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 02:23:57 PM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
input clock,
//buttons
input logic reset,
input logic record,
input logic play,
//switches
input logic clipselectionwr,
input logic clipselectionr,
//output logic
output logic [4:0]q
);

always_ff@(posedge clock)
begin
if(reset)
    q  <= 5'b0;
else 
    q <= {reset,record,play,clipselectionwr,clipselectionr};
end

endmodule
