//Tabla03SOP
//Pablo Moreno carne 19034

module Tabla03SOP();

//definir cables

wire N1, N2, N3, N4; //cuatro compuertas NOT
wire A1, A2, A3, A4, A5, A6, A7, out; //una compuerta final or, compuesta de siete entradas and


//Declaracion de entradas
reg A, B, C, D;

//Compuertas

not NOA(N1, A); // Negacion de A con compuerta not
not NOB(N2, B); // Negacion de B con compuerta not
not NOC(N3, C); // Negacion de C con compuerta not
not NOD(N4, D); //Negacion de D con compuerta not
and a1(A1, N1, N2, N3, N4); //Primera compuerta and
and a2(A2, N1, N2, N3, D); //Segunda compuerta and
and a3(A3, N1, N2, C, N4); //Tercera compuerta and
and a4(A4, N1, N2, C, D); //Cuarta compuerta and
and a5(A5, A, N2, N3, N4); //Quinta compuerta and
and a6(A6, A, N2, C, N4); //Sexta compuerta and
and a7(A7, A, B, C, N4); //Septima compuerta and
or sal(out, A1, A2, A3, A4, A5, A6, A7); //Compuerta final unificadora


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
  $dumpfile("Tabla03SOP_tb.vcd"); //nombre archivo
  $dumpvars(0,Tabla03SOP); //nombre del documento
end

endmodule
