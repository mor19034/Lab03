//Pablo Moreno, 19034
module Testbench();
    reg [3:0]oprnd;
    reg clk, reset, enB2, enB1, en_Acu;
    reg [2:0]S;
    wire Carry;
    wire zero;
    wire [3:0]out;

    always
        #1 clk = ~clk;

    Circuito2 b(oprnd, enB1, clk, reset, enB2, en_Acu, S, Carry, zero, out);

    initial begin
        #1
        $display("\n");
        $display("--------------------------------------Ejercicio2-----------------------------------");
        $display(" clk | reset | enB1   | oprnd | enB2 | en_accu |    S     ||  Carry | zero | out1  ");
        $monitor(" %b   |   %b   |   %b    |   %b  |   %b |   %b    |    %b   || %b      |  %b   |   %b ", clk, reset, enB1, oprnd, enB2, en_Acu, S, Carry, zero, out);
        clk = 0; reset = 1; enB1 = 0; oprnd = 4'b0000; enB2 = 0; en_Acu = 0; S = 3'b000;
        #2 reset = 0; enB1 = 1; oprnd = 4'b0011; enB2 = 1; en_Acu = 0; S = 3'b010;
        #2 reset = 0; enB1 = 1; oprnd = 4'b0101; enB2 = 1; en_Acu = 1; S = 3'b011;
        #2 reset = 0; enB1 = 1; oprnd = 4'b0111; enB2 = 1; en_Acu = 0; S = 3'b000;
        #2 reset = 0; enB1 = 1; oprnd = 4'b1111; enB2 = 0; en_Acu = 0; S = 3'b011;
        #2 reset = 0; enB1 = 1; oprnd = 4'b1111; enB2 = 0; en_Acu = 0; S = 3'b100;
    end

    initial
     #14 $finish;

     //GTK WAVE
     initial begin
         $dumpfile("Ejercicio2_tb.vcd");
         $dumpvars(0, Testbench);
     end

endmodule
