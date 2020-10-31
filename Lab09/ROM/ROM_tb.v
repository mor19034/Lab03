module testbench ();

reg EN;
reg [6:0]address;
wire [12:0]data;


ROM R(EN, address, data);

initial begin
#1
  $display("Enable  | address | data ");
  $display("-------------------------");
  $monitor("%b      |%b       | %b   ", EN, address, data);

  EN = 0; address = 7'b0101010;
  EN = 1; address = 7'b0101010;
  #2 address = 7'bxxxxxx0;
  #2 address = 7'b00001x1;
  #2 address = 7'b00000x1;
  #2 address = 7'b00011x1;
  #2 address = 7'b00011x1;
  #2 address = 7'b0010xx1;
  #2 address = 7'b0011xx1;
  #2 address = 7'b0100xx1;
  #2 address = 7'b0101xx1;
  #2 address = 7'b0110xx1;
  #2 address = 7'b0111xx1;
  #2 address = 7'b1000x11;
  #2 address = 7'b1000x01;
  #2 address = 7'b1001x11;
  #2 address = 7'b1001x01;
  #2 address = 7'b1010xx1;
  #2 address = 7'b1011xx1;
  #2 address = 7'b1100xx1;
  #2 address = 7'b1101xx1;
  #2 address = 7'b1110xx1;
  #2 address = 7'b1111xx1;

end

initial
  #50 $finish;

initial begin
  $dumpfile("ROM_tb.vcd"); //nombre archivo
  $dumpvars(0,testbench); //nombre del documento
end

endmodule //testbench
