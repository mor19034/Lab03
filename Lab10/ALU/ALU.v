module ALU (
  input wire [3:0] A,B, //2 enttradas de 4-bit's
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
                Carry = (S[4] == 1) ? 1:0; //Si el bit mas significativo es 1, entonces Carry se enciende
                Zero = (S[4] == 0) ? 1:0; //Si el bit mas significativo es 0, entonces Zero se enciende
                Out = S[3:0];
              end

      3'b010: begin //Dejar pasar B
                S = 5'b00000;
                S = B;
                Carry = (S[4] == 1) ? 1:0;
                Zero = (S[4] == 0) ? 1:0;
                Out = S[3:0];
              end

      3'b011: begin //SUMA
                S = 5'b00000;
                S = A + B;
                Carry = (S[4] == 1) ? 1:0;
                Zero = (S[4] == 0) ? 1:0;
                Out = S[3:0];
              end

        3'b001: begin //COMPARACION
                  S = 5'b00000;
                  S = A - B;
                  Carry = (S[4] == 1) ? 1:0;
                  Zero = (S[4] == 0) ? 1:0;
                  Out = S[3:0];
                end

      3'b100:begin //NOR
                S = 5'b00000;
                S = ~(A & B); //Operacion OR B negado NO
                Carry = (S[4] == 1) ? 1:0;
                Zero = (S[4] == 0) ? 1:0;
                Out = S[3:0];
              end
    endcase
  end
endmodule //ALU
