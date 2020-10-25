//Mux 2:1
module mux2(
  input wire  D0, D1,
  input wire S,
  output wire Y);
assign Y = S ? D1: D0;

endmodule //module mux2

//Mux 4:1
module mux4 (
  input wire D0 , D1, D2, D3, S0, S1,
  output wire Y1);

  wire W1, W2;

  //Hay que relacionarlo con mux2
  mux2 box1(D0, D1, S0, W1);
  mux2 box2(D2, D3, S0, W2);
  mux2 box3(W1, W2, S1, Y1);

endmodule // mux4

//Mux 8:1
module mux8 (
  input wire D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2,
  output wire Y2);

wire W1, W2;

//Ahora se hace una relacion de dos mux 4 y un mux 2
mux4 box1(D0, D1, D2, D3, S0, S1, W1);
mux4 box2(D4, D5, D6, D7, S0, S1, W2);
mux2 box3(W1, W2, S2, Y2); //aqui se utiliza un mux 2 para unificar los muxes 4

endmodule // mux8

module Tabla1_8 (input wire A, B, C, output wire Y);

  wire G, V; //G es 0 porque es tierra y V es 1 porque es voltaje
  assign G = 0;
  assign V = 1;

  mux8 T1_8(G, V, V, G, V, G, G, V, A, B, C, Y);

endmodule // Tabla1_8

//Implementacion de mux 4:1 en tabla 1
module Tabla1_4 (input wire A, B, C, output wire Y);

  wire Cs, CNO; //son las entradas C normal y la C negada

  assign Cs = C;
  assign CNO = ~C;

  mux4 T1_4(Cs, CNO, CNO, Cs, A, B, Y);

endmodule // Tabla1_4

//Implementacion de mux 2:1 en tabla 1
module Tabla1_2 (input wire A, B, C, output wire Y);

  wire B0, C0; //En el dibujo del 2:1 sus entradas son B y C

  assign B0 = (B ^ C);
  assign C0 = ~(B ^ C);

  mux2 T1_2(B0, C0, A, Y);

endmodule // Tabla1_2

//Se va a implementar la tabla 2 con los muxes
module Tabla2_8 (input wire A, B, C, output Y);

wire G, V;

  assign G = 0;
  assign V = 1;

//implementacion del modulo mux8
mux8 T2_8(V, G, G, G, G, V, V, G, A, B, C, Y);

endmodule // Tabla2_8

//mux4
module Tabla2_4 (input wire A, B, C, output wire Y);

wire Cs, CNO, GND;

assign Cs = C;
assign CNO = ~C;
assign GND = 0;

mux4 T2_4(CNO, GND, Cs, CNO, A, B, Y);

endmodule // Tabla2_4



//implementacion del modulo mux4
