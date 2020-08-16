module testbench();

reg p1, p2, p3, p4, p5, p6, p7, p8, p9;
wire y1, y2, y3;

Tabla1_8 T1_8(p1, p2, p3, y1);

initial begin
#1
$display("\n");
$display("Tabla 1 8:1");
$display("A B C | Y");
$display("------|--");
$monitor("%b %b %b | %b", p1, p2, p3, y1);
     p1 = 0; p2 = 0; p3 = 0;
  #1 p1 = 0; p2 = 0; p3 = 1;
  #1 p1 = 0; p2 = 1; p3 = 0;
  #1 p1 = 0; p2 = 1; p3 = 1;
  #1 p1 = 1; p2 = 0; p3 = 0;
  #1 p1 = 1; p2 = 0; p3 = 1;
  #1 p1 = 1; p2 = 1; p3 = 0;
  #1 p1 = 1; p2 = 1; p3 = 1;
end

Tabla1_4 T1_4(p4, p5, p6, y2);

initial begin
#10
$display("\n");
$display("Tabla 1 4:1");
$display("A B C | Y");
$display("------|--");
$monitor("%b %b %b | %b", p4, p5, p6, y2);
     p4 = 0; p5 = 0; p6 = 0;
  #1 p4 = 0; p5 = 0; p6 = 1;
  #1 p4 = 0; p5 = 1; p6 = 0;
  #1 p4 = 0; p5 = 1; p6 = 1;
  #1 p4 = 1; p5 = 0; p6 = 0;
  #1 p4 = 1; p5 = 0; p6 = 1;
  #1 p4 = 1; p5 = 1; p6 = 0;
  #1 p4 = 1; p5 = 1; p6 = 1;
end

Tabla1_2 T1_2(p7, p8, p9, y3);

initial begin
#20
$display("\n");
$display("Tabla 1 4:1");
$display("A B C | Y");
$display("------|--");
$monitor("%b %b %b | %b", p7, p8, p9, y3);
     p7 = 0; p8 = 0; p9 = 0;
  #1 p7 = 0; p8 = 0; p9 = 1;
  #1 p7 = 0; p8 = 1; p9 = 0;
  #1 p7 = 0; p8 = 1; p9 = 1;
  #1 p7 = 1; p8 = 0; p9 = 0;
  #1 p7 = 1; p8 = 0; p9 = 1;
  #1 p7 = 1; p8 = 1; p9 = 0;
  #1 p7 = 1; p8 = 1; p9 = 1;
end


initial
  #50 $finish;

  initial begin
    $dumpfile("lab05_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
