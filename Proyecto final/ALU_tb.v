module testALU();

reg [3:0]A;
reg [3:0]B;
reg [2:0]command;
wire carry;
wire zero;
wire [3:0]S;

ALUL10_up calc(A, B, command, carry, zero, S);


initial begin
  #4900
  $display("   A   |    B    |    COM    |   carry   |  zero    |   R    ");
  $display("--------------------------------------");
  $monitor("   %b       %b        %b         %b         %b         %b", A, B, command, carry, zero, S);
     A = 4'b0000; B = 4'b0111; command = 3'b000;
  #1 A = 4'b0010; B = 4'b0101; command = 3'b001;
  #1 A = 4'b0100; B = 4'b0001; command = 3'b100;
  #1 A = 4'b0101; B = 4'b0011; command = 3'b101;
  #1 A = 4'b0110; B = 4'b0010; command = 3'b110;
  #1 A = 4'b0101; B = 4'b0011; command = 3'b111;

end
initial
#5000 $finish;

initial begin
  $dumpfile("ALU_tb.vcd");
  $dumpvars(0, testALU);
end
endmodule
