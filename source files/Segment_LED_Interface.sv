`timescale 1ns / 1ps
//read from buttons/switch and display to led output, no need to connect to controller

// should be done plz error check
module Segment_LED_Interface(
input logic switch0, //which memory block to write to, 1 or 2 J15 package pins
input logic switch1, //which block to read from, 1 or 2  L16
input logic clock,
output logic a0,//right led
output logic a1,//left led
output logic [6:0]cathode //7 - 0  = a-g

    );



always_comb
begin
    case(clock) //every on/off clock cycle
    1'b0: 
        begin
            if(switch0)
                cathode[6:0] = 7'b001_001_0; //2 //if switch0 = 1, display 2
            else 
                cathode[6:0] = 7'b100_111_1; //1 //if switch0 = 0, display 1
        end

        1'b1: // when clock 1 
        begin
            if(switch1) 
                cathode[6:0] = 7'b001_001_0; //2 //if switch1 = 1, display 2 
            else
                cathode[6:0] = 7'b100_111_1; //1 //if switch1 = 0, display 1 
        end
          
    endcase
 
     //cycle display 1 
    case(clock)
        1'b0: 
            a0=0;
        1'b1: 
            a0=1;
    endcase

    //cycle display 2
    case(clock)
    1'b0: 
        a1=1;
    1'b1: 
        a1=0;
    endcase
end


endmodule
