module testbench ();

reg J, K, CLK, EN, reset;
wire Qprev;


FF_JK FF1(J, K, CLK, EN, reset, Qprev);


initial begin
#1
  $display("J  | K | CLK | EN | reset | Qprev");
  $display("-----------------------------");
  $monitor("%b |%b | %b | %b  | %b    | %b   ", J, K, CLK, EN, reset, Qprev);

  //entradas de los FF
  J = 0; K = 0; CLK = 0; EN = 0; reset = 0;
  #2 reset = 1;
  #2 reset = 0;
  #2 EN = 1; J = 1;
  #2 J = 0; K = 0;
  #2 K = 1;
  #2 J = 1;
  #4 EN = 0;

end
always
#1 CLK = ~CLK;

initial
  #20 $finish;

initial begin
  $dumpfile("FF_JK_tb.vcd"); //nombre archivo
  $dumpvars(0,testbench); //nombre del documento
end

endmodule //testbench
