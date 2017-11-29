`timescale 1ns / 1ps
//reads input from microphone, stores it into memory
//needs to read a line of 0/1 and creates a 16 bit word
//outputs done signal every 16 clock cycles
//needs to convert a 100mhz clock signal to 1mhz signal internally
module Deserializer(
input logic clock,
input logic enable,
input logic data_in,
output logic done,
output logic [15:0] data,
output logic pdm_clk_o, //microphone clock, needs to be 1 mhz, just feed it thru lol
output logic pdm_irsel_o //channel select
    );
    logic [3:0]counter;
    logic [15:0]tempdata;
     always@(posedge clock || enable == 1'b1)
     begin
     tempdata[0]<=data_in;
     tempdata <= tempdata<<1;
     if(counter == 4'd15) data <= tempdata;
     end
     
    
    
    
    always@(posedge clock || enable == 1'b0)
    begin
    if (counter == 4'd15)
    counter <= 4'd0;
    else 
    begin
    counter <= counter +1;
    done = 0;
    end
    end
    
    always@(posedge clock )
    begin
    if(counter == 4'd15)
    begin
    done <=~done;
    end
    end
endmodule