//intended for use in both deserializer/serializer to create address locations to read/write to memory

//maybe it might be easier to implement this inside both serializer/deserializer, since this would run at 100 mhz, while both serializers run at 1mhz

module Address_creator(
input logic clock,
input logic done,
output logic [15:0]address
);

always@(posedge clock)
begin 
if(address == 16'd62499)
    address <= 16'b0;
if(done) address <= address +1'b1;
  
end

endmodule