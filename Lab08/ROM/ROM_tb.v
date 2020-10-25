module testbenchROM ();
  reg [11:0]address;
  wire [7:0]data;

ROM Prueba(address, data);

initial begin
  #1
  $display("-------------------------");
  $display("-----------ROM-----------");
  $display("|   address       |          data  | ");
  $monitor("|      %b    |    %b   | ", address, data);

     address = 12'b000000000000;
  #1 address = 12'b000000000001;
  #1 address = 12'b000000000010;
  #1 address = 12'b000000000011;
  #1 address = 12'b000000000100;
  #1 address = 12'b000000000101;
  #1 address = 12'b000000000110;
  #1 address = 12'b000000000111;
  #1 address = 12'b000000001000;
  #1 address = 12'b000000001001;
end

initial
#21 $finish;

initial begin
  $dumpfile("ROM_tb.vcd");
  $dumpvars(0, testbenchROM);
end

endmodule //testbenchALU
