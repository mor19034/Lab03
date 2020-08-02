//Tabla04SOP
//Pablo Moreno carne 19034

module Tabla04SOP();

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
and y1(A1, N1, N2, N3, N4);
and y2(A2, N1, N2, C, N4);
and y3(A3, N1, N2, C, D);
and y4(A4, N1, B, C, N4);
and y5(A5, N1, B, C, D);
and y6(A6, A, N2, N3, N4);
and y7(A7, A, N2, C, N4);
or o(out, A1, A2, A3, A4, A5, A6, A7);

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
  $dumpfile("Tabla04SOP_tb.vcd"); //nombre archivo
  $dumpvars(0,Tabla04SOP); //nombre del documento
end

endmodule
