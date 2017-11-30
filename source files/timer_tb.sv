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
logic data_in;
logic done;
logic [15:0] data;
logic pdm_clk_o; //microphone clock, needs to be 1 mhz, just feed it thru lol
logic pdm_irsel_o; //channel select
logic [3:0]countero;
logic [15:0]tempdatao;

Deserializer ser(
.clock(clock),
.enable(enable),
.data_in(data_in),
.done(done),
.data(data),
.pdm_clk_o(pdm_clk_o), //microphone clock, needs to be 1 mhz, just feed it thru lol
.pdm_irsel_o(pdm_irsel_o),

.countero(countero),
.tempdatao(tempdatao)
);

always #5 clock = ~clock;

always #5 data_in = ~data_in; //wanted a prime for more variability in random data input


initial 
begin
enable = 0;
data_in = 0;
clock = 0;
#15
enable = 1;



#1000000000
enable = 0;
#100 $finish;
end
endmodule
