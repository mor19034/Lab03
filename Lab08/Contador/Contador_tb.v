module testebenchContador ();

reg CLK, reset, En, LA;
reg [11:0]load;
wire [11:0]out;

contador Co(CLK, reset, En, LA, load, out);

//Clock
always
  #1 CLK = ~CLK;

initial begin
#1
$display("-------------------------");
$display("----------Contador--------");
$display("|   CLK   |  reset  | Enable| Load activation | Load | out");
$monitor("    %b        %b        %b          %b           %b    %b ", CLK, reset, En, LA, load, out);
CLK = 0; reset = 0; En = 0; LA = 0; load = 12'b000000000000;
#1 reset = 0; //El contador no hace nada
#1 reset = 1; //El contador se pone en 0
#1 reset = 0;
#1 LA = 1; load = 12'b000010000000; //Se le pre carga un valor al Contador para iniciar desde alli
#1 LA = 0; En = 1; //empieza a contador
#1 En = 1;
end

initial
  #21 $finish ;

initial begin
  $dumpfile("Contador_tb.vcd");
  $dumpvars(0, testebenchContador);
end
endmodule //testebenchContador
