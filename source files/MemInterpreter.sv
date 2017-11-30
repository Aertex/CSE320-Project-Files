`timescale 1ns / 1ps


module MemInterpreter(
input logic [1:0] memoryena,
output logic block1ena,
output logic block1wea,

output logic block2ena,
output logic block2wea
    );
    
    always_comb
    begin
    case(memoryena)
    {1'b0,1'b0}:
    begin
    block1ena = 1;
    block1wea = 0;
    
    block2ena = 0;
    block2wea = 0;
    end
    
    {1'b0,1'b1}:
    begin
    block1ena = 1;
    block1wea = 1;
    
    block2ena = 0;
    block2wea = 0;
    end
    {1'b1,1'b0}:
    begin
    block1ena = 0;
    block1wea = 0;
    
    block2ena = 1;
    block2wea = 0;
    end
    {1,1}:
    begin
    block1ena = 0;
    block1wea = 0;
    
    block2ena = 1;
    block2wea = 1;
    end
    endcase
    end
    
endmodule
