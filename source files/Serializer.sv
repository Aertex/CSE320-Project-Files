`timescale 1ns / 1ps
//reads input from memory address via the address creator
//reads 16 bit words and transforms it into 16 1-bit cycles
//outputs done signal for 1 cycle every 16 cycles

module Serializer( //shifts new bits right to left

    input logic clock,
    input logic enable,
    input logic [15:0] data_in,
    output logic [3:0] counter,
    output logic done,
    output logic audio_enable, //needed to enable audio, D12
    output logic audio_data
    
);

    logic [3:0]counter = 4'b0; //counter for counting 16 cycles
    logic [15:0]tempdata;
    
    
 always_comb audio_enable = enable;
 
    
    always@(posedge clock) 
    begin
    if(counter==0) tempdata<=data_in; //reads new data at the start of every count cycle
    end
    
    
     always@(posedge clock)
       begin
      
       
       if(enable)
          begin
          
           audio_data = tempdata[15];
           
           tempdata = tempdata<<1;
       
       
       
           if(counter == 4'd15)
           begin

           done = 1'b1;
           
           counter <=4'd0;
           
           end
           else done = 1'b0;
          end
        else
            counter <= 4'b0;
       
       end
    
    
    always@(posedge clock)
    begin
    
        if(~enable) 
            counter<=4'd0;
    
        else
        begin 
            counter <= counter+ 4'b0001;
        end
    
    end
    
endmodule