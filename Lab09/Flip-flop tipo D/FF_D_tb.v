module testbench ();

//flip flop de un bit
reg D, CLK, EN, reset;
reg [1:0]D2; //Dos bits
reg [3:0]D4; //4 bits
wire Q;
wire [1:0]Q2;
wire [3:0]Q4;

FF_D1 FF1(D, CLK, EN, reset, Q);
FF_D2 FF2(D2, CLK, EN, reset, Q2);
FF_D4 FF4(D4, CLK, EN, reset, Q4);


initial begin
#1
  $display("D  | D2 | D4 | CLK | EN | reset | Q | Q2 | Q4");
  $display("--------------------");
  $monitor("%b | %b | %b | %b  | %b | %b    |%b |%b  | %b", D, D2, D4, CLK, EN, reset, Q, Q2, Q4);

  //entradas de los FF
  D = 0; D2 = 2'b00; D4 = 4'b0000; CLK = 0; EN = 0; reset = 0;
  #1 reset = 1;
  #1 reset = 0;
  #1 EN = 1;
  #1 D = 1; D2 = 2'b01; D4 = 4'b0001;
  #1 D = 0; D2 = 2'b10; D4 = 4'b0010;
  #1 D = 1; D2 = 2'b11; D4 = 4'b1000;

end
always
#1 CLK = ~CLK;

initial
  #20 $finish;

initial begin
  $dumpfile("FF_D_tb.vcd"); //nombre archivo
  $dumpvars(0,testbench); //nombre del documento
end

endmodule //testbench
