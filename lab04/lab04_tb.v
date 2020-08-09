module testebench();

//Se van a reutilizar algunas variables en bloques de 2 en 2
reg p1, p2, p3, p4, p5, p6, p7; //Estos son para las primeras 4 tablas
wire out1, out2, out3, out4; //Son las salidas de las primeras 4 tablas
reg p8, p9, p10, p11, p12, p13, p14; //Estos son para las 4 tablas del ejercicio 2
wire out5, out6, out7, out8; //Salidas de las cuatro tablas del ejercicio 2

//Ejercicio 1, tabla01 y tabla02
Ejercicio1_tabla1 G1(p1, p2, p3, out1);
Ejercicio1_tabla2 G2(p1, p2, p3, out2);

initial begin
#1
$display("Tabla 1 y 2 de ejercicio 01");
$display("A B C | Y1 Y2");
$display("------|------");
$monitor("%b %b %b | %b %b", p1, p2, p3, out1, out2);
     p1 = 0; p2 = 0; p3 = 0;
  #1 p3 = 1;
  #1 p2 = 1; p3 = 0;
  #1 p3 = 1;
  #1 p1 = 1; p2 = 0; p3 = 0;
  #1 p3 = 1;
  #1 p2 = 1; p3 =0;
  #1 p3 = 1;
end

//Ejercicio 1, tabla03 y tabla04
Ejercicio1_tabla3 G3(p4, p5, p6, p7, out3);
Ejercicio1_tabla4 G4(p4, p5, p6, p7, out4);

initial begin
#9
$display("\n");
$display("Tabla 3 y 4 de ejercicio 01");
$display("A B C D | Y1 Y2");
$display("--------|------");
$monitor("%b %b %b %b | %b %b", p4, p5, p6, p7, out3, out4);
     p4 = 0; p5 = 0; p6 = 0; p7 = 0;
  #1 p7 = 1;
  #1 p6 = 1; p7 = 0;
  #1 p7 = 1;
  #1 p5 = 1; p6 = 0; p7 = 0;
  #1 p7 = 1;
  #1 p6 = 1; p7 = 0;
  #1 p7 = 1;
  #1 p4 = 1; p5 = 0; p6 = 0; p7 =0;
  #1 p7 = 1;
  #1 p6 = 1; p7 = 0;
  #1 p7 = 1;
  #1 p5 = 1; p6 = 0; p7 = 0;
  #1 p7 = 1;
  #1 p6 = 1; p7 = 0;
  #1 p7 = 1;
end

//Ejerercicio 2, ecuación 1 y 3
Ejercicio2_tabla1 OP1(p8, p9, p10, p11, out5);
Ejercicio2_tabla3 OP3(p8, p9, p10, p11, out6);

initial begin
#25
$display("\n");
$display("Tabla 1 y 3 de ejercicio 02");
$display("A B C D | Y1 Y2");
$display("------|------");
$monitor("%b %b %b %b | %b %b", p8, p9, p10, p11, out5, out6);
     p8 = 0; p9 = 0; p10 = 0; p11 = 0; //p4 p5 p6 p7
  #1 p11 = 1;
  #1 p10 = 1; p11 = 0;
  #1 p11 = 1;
  #1 p9 = 1; p10 = 0; p11 = 0;
  #1 p11 = 1;
  #1 p10 = 1; p11 = 0;
  #1 p11 = 1;
  #1 p8 = 1; p9 = 0; p10 = 0; p11 =0;
  #1 p11 = 1;
  #1 p10 = 1; p11 = 0;
  #1 p11 = 1;
  #1 p9 = 1; p10 = 0; p11 = 0;
  #1 p11 = 1;
  #1 p10 = 1; p11 = 0;
  #1 p11 = 1;
end

//Ejercicio 2, tabla02 y tabla04
Ejercicio2_tabla2 OP2(p12, p13, p14, out7);
Ejercicio2_tabla4 OP4(p12, p13, p14, out8);

initial begin
#41
$display("\n");
$display("Tabla 2 y 4 de ejercicio 02");
$display("A B C | Y1 Y2");
$display("------|------");
$monitor("%b %b %b | %b %b", p12, p13, p14, out7, out8);
     p12 = 0; p13 = 0; p14 = 0;
  #1 p14 = 1;
  #1 p13 = 1; p14 = 0;
  #1 p14 = 1;
  #1 p12 = 1; p13 = 0; p14 = 0;
  #1 p14 = 1;
  #1 p13 = 1; p14 =0;
  #1 p14 = 1;
end

initial
  #49 $finish;

  initial begin
    $dumpfile("lab04_tb.vcd");
    $dumpvars(0, testebench);
  end

endmodule
