//Tabla02POS
//Pablo Moreno carne 19034

module Tabla02POS();

//definir cables

wire N1, N2, N3; //tres compuertas NOT
wire A1, A2, A3, A4, A5, out1; //una compuerta final and, compuesta de cinco entradas or

//Declaracion de entradas
reg A, B, C;

//Compuertas

not NOA(N1, A); // Negacion de A con compuerta not
not NOB(N2, B); // Negacion de B con compuerta not
not NOC(N3, C); // Negacion de C con compuerta not
or o1(A1, A, B, C); //Primera compuerta de or
or o2(A2, A, N2, C); //Segunda compuerta or
or o3(A3, A, N2, N3); //Tercera compuerta or
or o4(A4, N1, B, C); //Cuarta compuerta or
or o5(A5, N1, B, N3); //Quinta compuerta or
and y(out1, A1, A2, A3, A4, A5); //Ultima compuerta unificadora del resto de compuertas


initial begin
  $display("A B C/ Y");
  $display("-------");
  $monitor("%b %b %b/ %b", A, B, C, out1); //para poder ver la tabla de verdad

  //entradas de los modulos
  A = 0; B = 0; C = 0; //las entradas comienzan en 0
  #1 C=1; //en la segunda fila de la tabla de verdad, c cambia a 1
  #1 B=1; C=0;
  #1 C=1;
  #1 A=1; B=0; C=0;
  #1 C=1;
  #1 B=1; C=0;
  #1 C=1;
  #1 $finish; //fin de las posibles combinaciones de la tabla de verdad
end

initial begin
  $dumpfile("Tabla02POS_tb.vcd"); //nombre archivo
  $dumpvars(0,Tabla02POS); //nombre del documento
end

endmodule
