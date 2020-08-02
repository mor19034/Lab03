//Tabla01SOP
//Pablo Moreno carne 19034

module Tabla01SOP();

//definir cables

wire N1, N2, N3; //tres compuertas NOT
wire A1, A2, A3, A4, A5, out1; //una compuerta final or, compuesta de cinco entradas y una salida

//Declaracion de entradas
reg A, B, C;

//Compuertas

not NOA(N1, A); // Negacion de A con compuerta not
not NOB(N2, B); // Negacion de B con compuerta not
not NOC(N3, C); // Negacion de C con compuerta not
and y1(A1, N1, N2, N3); // Primers compuerta and
and y2(A2, N1, B, N3); // Segunda compuerta and
and y3(A3, A, N2, N3); // Tercera compuerta and
and y4(A4, A, N2, C); // Cuarta compuerta and
and y5(A5, A, B, C); // Quinta compuerta and
or (out1, A1, A2, A3, A4, A5); // Ultima compuerta que junta todas las anteriores en un or

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
  $dumpfile("Tabla01SOP_tb.vcd"); //nombre archivo
  $dumpvars(0,Tabla01SOP); //nombre del documento
end

endmodule
