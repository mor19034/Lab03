//programa para la ALU, por medio de casos se van a relizar las operaciones de la ALU
//--------------------------------FUNCIONES------------------------------------------
//  |000| Out = AND; |001| Out = OR; |010| Out = A + B; |011| Out = 0; |100| Out = A AND ~B;
// |101| Out = A OR ~B; |110| Out = A - B; |111| Out = SLT;

module ALU (
  input wire [3:0] A,B, //2 enttradas de 4-bit's
  input wire [2:0]Command, //3 bit's de funciones
  output reg [3:0]Out); //Salida de 3 bit's

  always @ (A or B or Command) begin

    //Aqui van los casos que tiene la ALU, segun cada operacion (se puede hasta 8 casos por la cantidad de bits en Command)
    case(Command)
      3'b000:Out = A & B; //Operacion AND
      3'b001:Out = A | B; //Operacion OR
      3'b010:Out = A + B; //Operacion suma
      3'b011:Out = 3'b000; //Esta operacion no hace nada
      3'b100:Out = A & ~B; //Operacion AND B negado
      3'b101:Out = A | ~B; //Operacion OR B negado
      3'b110:Out = A - B; //Operacion resta
      3'b111:Out = (A < B) ? 1:0; //Operacion comparacion de oposicion si A > B
      //default: Out = 3'b000; si se toma una opcion no asignada se da un valor de 0...
      //esto va a ser util cuando haya muchas mas funciones que no hagan nada

    endcase
  end

endmodule //ALU
