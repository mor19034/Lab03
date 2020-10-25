module testbenchALU ();
  reg [3:0]A,B;
  reg [2:0]Command;
  wire [3:0]out;

ALU Prueba(A, B, Command, out);

initial begin
#1
$display("---------------------------------------");
$display("|   A  |   B  |   C  |  Result  |");
$monitor("|  %b  |  %b  |  %b  |  %b   |", A, B, Command, out);

   A = 4'b0001; B = 4'b0001; Command = 3'b000;
#1 A = 4'b0001; B = 4'b0001; Command = 3'b001;
#1 A = 4'b0001; B = 4'b0001; Command = 3'b010;
#1 A = 4'b0001; B = 4'b0001; Command = 3'b011;
#1 A = 4'b0001; B = 4'b0001; Command = 3'b100;
#1 A = 4'b0001; B = 4'b0001; Command = 3'b101;
#1 A = 4'b0001; B = 4'b0001; Command = 3'b110;
#1 A = 4'b0001; B = 4'b0001; Command = 3'b111;
end

initial
#21 $finish;

initial begin
  $dumpfile("ALU_tb.vcd");
  $dumpvars(0, testbenchALU);
end

endmodule //testbenchALU
