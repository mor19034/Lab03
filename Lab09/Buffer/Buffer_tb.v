module testbench ();

reg En;
reg [3:0]In;
wire [3:0]Out;


BUFt FF1(En, In, Out);


initial begin
#1
  $display("Enable  | In | Out");
  $display("------------------");
  $monitor("%b      |%b   |%b ", En, In, Out);

  //entradas de los FF
  En = 0; In = 4'b0000;
  #2 En = 0; In = 4'b0001;
  #2 En = 1; In = 4'b0000;
  #2 En = 1; In = 4'b0100;
  #2 En = 1; In = 4'b1000;
end

initial
  #12 $finish;

initial begin
  $dumpfile("Buffer_tb.vcd"); //nombre archivo
  $dumpvars(0,testbench); //nombre del documento
end

endmodule //testbench
