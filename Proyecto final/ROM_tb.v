module testRom();
wire [7:0]data;
reg [11:0]addres;

ROM U1(addres, data);

initial begin
#4700
$display("Memoria ROM Josue Salazar ");
$display("------------------------- ");
$display("Direccion  |  Resultado    ");
$monitor("    %b      |    %b", addres, data);
   addres = 12'b0;
#2 addres = 12'b000000000001;
#2 addres = 12'b000000000010;
#2 addres = 12'b000000000011;
#2 addres = 12'b000000000100;
end

initial
#4800 $finish;

initial begin
    $dumpfile("ROM_tb.vcd");
    $dumpvars(0, testRom);
end
endmodule
