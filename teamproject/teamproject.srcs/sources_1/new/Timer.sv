//timer used to measure out a period of 2 seconds, system will run at 100mhz, so 200 000 000 clock cycles
module timer(
input logic enable,

input logic clock,
output logic done_signal //output of timer when 2 seconds have passed, passed to controller to cut off enable
);

logic [27:0]counter = 28'd0;


always@(posedge clock)
begin 
if((counter == 28'd199_999_999)||(enable == 1'b0))
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