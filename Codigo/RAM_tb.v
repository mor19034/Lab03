module testRAM();

reg [0:11]address;
reg cs;
reg we;

wire [0:3]data;

RAM ram(address, cs, we, data);

initial begin
    #4500
    $display("Address    | cs | we |   data  |");
    $monitor("   %b       %b   %b         %b  ", address, cs, we, data);

    cs = 1;
    we = 0;
    $display("reading...");
    #1 address = 12'h000;
    #1 address = 12'h001;
    #1 address = 12'h002;
    $display("writing...");
    #1 we = 1; address = 12'h000;
    #1 address = 12'h001;
    #1 address = 12'h002;

    $display("reading...");
    #1 we = 0;address = 12'h000;
    #1 address = 12'h001;
    #1 address = 12'h002;
end

initial
    #4600 $finish;

initial begin
  $dumpfile("RAM_tb.vcd");
  $dumpvars(0, testRAM);
end
endmodule
