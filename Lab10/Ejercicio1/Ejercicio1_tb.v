module testbench ();
  reg CLK, Reset, EN_PC, EN_Fetch, ENload;
  reg [11:0]load;
  wire [7:0]program_byte;
  wire [3:0]instr;
  wire [3:0]oprnd;

  ejercicio1 test(CLK, Reset, EN_PC, EN_Fetch, ENload, load, instr, oprnd, program_byte);

  always
  #1 CLK = ~CLK;

  initial begin
    #1
    $display("--------------------------------Ejercicio 1----------------------------");
    $display("|  CLK | RESET | EN_PC  | EN_Fetch | ENload| LOAD            | instr |oprnd | program_byte");
    $monitor("|  %b   |  %b    |  %b   | %b   | %b     | %b   | %b    |  %b  |  %b       ", CLK, Reset, EN_PC, EN_Fetch, ENload, load, instr, oprnd, program_byte);

       CLK = 0; Reset = 1; EN_PC = 0; ENload = 0; EN_Fetch = 0; load = 12'b000000000000;
    #2 Reset = 0; EN_PC = 1; EN_Fetch = 1; ENload = 0;
    #2 Reset = 0; EN_PC = 1; EN_Fetch = 1; ENload = 0;
    #2 Reset = 0; EN_PC = 1; EN_Fetch = 1; ENload = 1; load = 12'b000000000100; //carga lo que esta en la localidad 4 (0100)
    #2 Reset = 0; EN_PC = 1; EN_Fetch = 1; ENload = 0;
    #2 Reset = 0; EN_PC = 1; EN_Fetch = 1; ENload = 1; load = 12'b000000001000;
    end


    initial
      #15 $finish;

    initial begin
      $dumpfile("Ejercicio1_tb.vcd");
      $dumpvars(0,testbench);
    end

endmodule //testbench
