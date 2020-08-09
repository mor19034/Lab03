//En esta parte se implementan todas las ecuaciones con gate label modeling

//Ecuación implementada Y = (A'*C')+(A*C)+(A*B');
module Ejercicio1_tabla1 (input wire A, B, C, output wire Y);

wire NA, NB, NC, W1, W2, W3; //Tres cables not  y tres grupos and

//funciones logicas

//Ecuación a implentar Y = (A'*C')+(B'*C')+(A*C);
not(NA, A); //las primeras tres son solo para negar las tres entradas
not(NB, B);
not(NC, C);
and(W1, NA, NC);
and(W2, NB, NC);
and(W3, A, C);
or (Y, W1, W2, W3); //salida

endmodule //Ejercicio1_tabla1

//Ecuación a implementar Y= B';
module Ejercicio1_tabla2 (input wire A, B, C, output wire Y);

//función lógica

not(Y, B); //no hubo necedidad de crear un cable extra, solo el de salida

endmodule //Ejercicio1_tabla2

//Ecuación a implentar Y = (A'*B'*C'*D')+(A'*B'*C*D)+(A'*B*C'*D)...
//+(A'*B*C*D')+(A*B*C'*D')+(A*B*C*D)+(A*B'*C*D)+(A*B'*C*D');

module Ejercicio1_tabla3 (input wire A, B, C, D, output wire Y);

wire NA, NB, NC, ND, W1, W2, W3, W4, W5, W6, W7, W8; //Cuatro cables de not y 8 cables and

//funciones logicas

not(NA, A);
not(NB, B);
not(NC, C);
not(ND, D);
and(W1, NA, NB, NC, ND);
and(W2, NA, NB, C, D);
and(W3, NA, B, NC, D);
and(W4, NA, B, C, ND);
and(W5, A, B, NC, ND);
and(W6, A, B, C, D);
and(W7, A, NB, NC, D);
and(W8, A, NB, C, ND);
or(Y, W1, W2, W3, W4, W5, W6, W7, W8);

endmodule //Ejercicio1_tabla3

//Ecuación a implentar Y = (B'*D')+(A*B)+(A*C);

module Ejercicio1_tabla4 (input wire A, B, C, D, output wire Y);

//funciines logicas

wire NB, ND, W1, W2, W3; //Dos cables not y 3 cables and

not(NB, B);
not(ND, D);
and(W1, NB, ND);
and(W2, A, B);
and(W3, A, C);
or(Y, W1, W2, W3);

endmodule //Ejercicio1_tabla4

//En esta parte se implementan todas las ecuaciones con operadores lógicos

// Ecuación a implentar Y = (B'*C'*D')+(A*C')+(A*D')+(A*B');
module Ejercicio2_tabla1 (input wire A, B, C, D, output wire Y);

  assign Y = (~B & ~C & ~D) | (A & ~C) | (A & ~D) | (A & ~B);

endmodule // Ejercicio2_tabla1

//Ecuación a implentar Y = C + B';
module Ejercicio2_tabla2 (input wire A, B, C, output wire Y);

  assign Y = (C) | (~B);

endmodule // Ejercicio2_tabla2

//Ecuación a implementar Y = B + (C'*D) + (A*D);
module Ejercicio2_tabla3 (input wire A, B, C, D, output wire Y);

  assign Y = (B) | (~C & D) | (A & D);

endmodule // Ejercicio2_tabla3

//Ecuación a implentar Y = B + (A'*C');
module Ejercicio2_tabla4 (input wire A, B, C, output wire Y);

  assign Y = (B) | (~A & ~C);

endmodule // Ejercicio2_tabla4
