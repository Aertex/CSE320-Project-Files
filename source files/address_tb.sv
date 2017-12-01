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
module addresstb();
logic clock = 1'b0;
logic done;
logic reset;
logic [15:0]address;

Address_creator address(
.clock(clock),
.done(done),
.reset(reset),
.address(address)
);


always
    #25 done = ~done;
always 
    #5 clock = ~clock;
    
initial 
begin
done = 0;
reset = 1;
#100 
$finish;
end
endmodule
