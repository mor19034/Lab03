module testbench ();

//flip flop de un bit
reg CLK, EN, reset;
wire Q;

FF_T FFT(CLK, EN, reset, Q); //El modulo solo tiene 3 entradas


initial begin
#1
  $display(" CLK | EN | reset | Q");
  $display("---------------------");
  $monitor("%b   | %b | %b    | %b|" , CLK, EN, reset, Q); 

  //entradas de los FF
  CLK = 0; EN = 0; reset = 0;
  #1 reset = 1;
  #1 reset = 0;
  #2 EN = 1;
  #1 EN = 0;
  #1 EN = 1;
  #1 EN = 0;
  #1 EN = 1;
  #3 EN = 0;
end
always
#1 CLK = ~CLK;

initial
  #20 $finish;

initial begin
  $dumpfile("FF_T_tb.vcd");
  $dumpvars(0,testbench);
end

endmodule //testbench
