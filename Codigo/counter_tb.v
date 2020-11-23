module TestCounter ();
  reg CLK, reset, En, load;
  reg [11:0]loadData;
  wire [11:0]out;

  contador Co(CLK, reset, En, load, loadData, out);

  //Clock
  always
    #1 CLK = ~CLK;

  initial begin
  #4000
  $display("-------------------------");
  $display("----------Contador--------");
  $display("|   CLK   |  reset  | Enable| Load activation | Load | out");
  $monitor("    %b        %b        %b          %b           %b    %b ", CLK, reset, En, load, loadData, out);
  CLK = 0; reset = 0; En = 0; LA = 0; load = 12'b000000000000;
  #2 reset = 1; //El contador se pone en 0
  #2 reset = 0;
  #2 LA = 1; load = 12'b000010000000; //Se le pre carga un valor al Contador para iniciar desde alli
  #2 LA = 0; En = 1; //empieza a contador
  #2 En = 1;
  end

  initial
    #4100 $finish ;

  initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0, TestCounter);
  end

endmodule //TestCounter
