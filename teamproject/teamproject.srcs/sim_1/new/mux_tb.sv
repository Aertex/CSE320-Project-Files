
module mux_tb();
logic [15:0] word1;
logic [15:0] word2;
logic select;
logic [15:0] wordout;
twoinputmux mux(
.mem1(word1),
.mem2(word2),
.memselect(select),
.dataout(wordout)
);

initial

begin
word1 = 16'b1000000000000001;
word2 = 16'b0111111111111110;

select = 0;

#500 select = 1;

end
endmodule