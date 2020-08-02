//Tabla04POS
//Pablo Moreno carne 19034

module Tabla04POS();

//definir cables

wire N1, N2, N3, N4; //cuatro compuertas NOT
wire A1, A2, A3, A4, A5, A6, A7, A8, A9, out; //una compuerta final and, compuesta de nuece entradas or


//Declaracion de entradas
reg A, B, C, D;

//Compuertas

not NOA(N1, A); // Negacion de A con compuerta not
not NOB(N2, B); // Negacion de B con compuerta not
not NOC(N3, C); // Negacion de C con compuerta not
not NOD(N4, D); //Negacion de D con compuerta not
or o1(A1, A, B, C, N4); //Primera compuerta or
or o2(A2, A, N2, C, D); //Segunda compuerta or
or o3(A3, A, N2, C, N4); //Tercera compuerta or
or o4(A4, N1, B, C, N4); //Cuarta compuerta or
or o5(A5, N1, B, N3, N4); //Quinta compuerta or
or o6(A6, N1, N2, C, D); //Sexta compuerta or
or o7(A7, N1, N2, C, N4); //Septima compuerta or
or o8(A8, N1, N2, N3, D); //Octava compuerta or
or o9(A9, N1, N2, N3, N4); //Novena compuerta or
and y(out, A1, A2, A3, A4, A5, A6, A7, A8, A9); //Ultima compuerta unificadora and

initial begin
  $display("A B C D/ Y");
  $display("-------");
  $monitor("%b %b %b %b/ %b", A, B, C, D, out); //para poder ver la tabla de verdad

  //entradas de los modulos
  A = 0; B = 0; C = 0; D=0; //las entradas comienzan en 0
  #1 D=1; //en la segunda fila de la tabla de verdad, D cambia a 1
  #1 C=1; D=0;
  #1 D=1;
  #1 B=1; C=0; D=0;
  #1 D=1;
  #1 C=1; D=0;
  #1 D=1;
  #1 A=1; B=0; C=0; D=0;
  #1 D=1;
  #1 C=1; D=0;
  #1 D=1;
  #1 B=1; C=0; D=0;
  #1 D=1;
  #1 C=1; D=0;
  #1 D=1;
  #1 $finish; //fin de las posibles combinaciones de la tabla de verdad
end

initial begin
  $dumpfile("Tabla04POS_tb.vcd"); //nombre archivo
  $dumpvars(0,Tabla04POS); //nombre del documento
end

endmodule
