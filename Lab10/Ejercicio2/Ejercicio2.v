//Pblo Moreno, 19034

//Modulo para los Latches
module Bus_Driver (
  input wire En,
  input wire [3:0]In,
  output wire [3:0]Out);

    assign Out = (En) ? In:4'bz;
endmodule //Bus_Driver


//Modulo para el acumulador, que es un Flip-Flop tipo D
module Acu (
  input CLK, reset, En,
  input [3:0]D,
  output reg [3:0]Q);

always @ (posedge CLK or posedge reset) begin
  if (reset)
    Q <= 1'b0000; //El valor de Q se pone en 0
  else if (En)
    Q <= D;
end
endmodule //Acu


module ALU (
  input wire [3:0]A, //2 enttradas de 4-bit's
  input wire [3:0]B,
  input wire [2:0]Command, //3 bit's de funciones
  output reg [3:0]Out,
  output reg Carry,
  output reg Zero); //salidas de la ALU

  reg[4:0]S; //Son 5 bits que la ALU va a tener que manejar, por los overflow
  always @ (A or B or Command) begin

    //Para poder hacer las
    case(Command)
      3'b000: begin   //Operacion ST, dejar pasar A
                S = 5'b00000;
                S = A;
                //Estas son las condiciones de las banderas
                Carry = S[4]; //Si el bit mas significativo es 1, entonces Carry se enciende
                Zero = (S[4] == 0) ? 1:0; //Si el bit mas significativo es 0, entonces Zero se enciende
                Out = S[3:0];
              end

      3'b010: begin //Dejar pasar B
                S = 5'b00000;
                S = B;
                Carry = S[4];
                Zero = (S[4] == 0) ? 1:0;
                Out = S[3:0];
              end

      3'b011: begin //SUMA
                S = 5'b00000;
                S = A + B;
                Carry = S[4];
                Zero = (S[4] == 0) ? 1:0;
                Out = S[3:0];
              end

        3'b001: begin //COMPARACION
                  S = 5'b00000;
                  S = A - B;
                  Carry = S[4];
                  Zero = (S[4] == 0) ? 1:0;
                  Out = S[3:0];
                end

      3'b100:begin //NOR
                S = 5'b00000;
                S = ~(A & B); //Operacion OR B negado NO
                Carry = S[4];
                Zero = (S[4] == 0) ? 1:0;
                Out = S[3:0];
              end
    endcase
  end
endmodule //ALU


//CIRCUITO DE EJERCICIO 2
module Circuito2 (
    input wire [3:0]oprnd,
    input ENB1, clk, reset, ENB2, en_Acu,
    input [2:0]S,
    output carry, zero,
    output [3:0]out2);

wire [3:0]B;
wire [3:0]outALU;
wire [3:0]A; //salida del acumulador

Bus_Driver B1(oprnd, ENB1, B);
Acu acumulador(clk, reset, en_Acu, outALU, A);
Bus_Driver B2(outALU, ENB2, out2);
ALU Al(A, B, S, outALU, carry, zero);

endmodule //Circuito2
