module testDecode();

reg [6:0]IN;
wire [12:0]OUT;

Decode U1(IN, OUT);

initial begin
#4300
$display("      IN      | Funcion  ");
$monitor("      %b               %b", IN, OUT);
   IN = 7'b??????0;
#2 IN = 7'b00001?1;
#2 IN = 7'b00000?1;
#2 IN = 7'b00011?1;
#2 IN = 7'b00010?1;
#2 IN = 7'b0010??1;
#2 IN = 7'b0011??1;
#2 IN = 7'b0100??1;
#2 IN = 7'b0101??1;
#2 IN = 7'b0110??1;
#2 IN = 7'b0111??1;
#2 IN = 7'b1000?11;
#2 IN = 7'b1000?01;
#2 IN = 7'b1001?11;
#2 IN = 7'b1001?01;
#2 IN = 7'b1010??1;
#2 IN = 7'b1011??1;
#2 IN = 7'b1100??1;
#2 IN = 7'b1101??1;
#2 IN = 7'b1110??1;

end
initial
  #4400 $finish;

initial begin
  $dumpfile("DECODER_tb.vcd");
  $dumpvars(0, testDecode);
end
endmodule
