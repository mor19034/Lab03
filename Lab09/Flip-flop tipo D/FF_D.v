//modulo de Flip flop tipo D de 1 bit
module FF_D1 (
  input D, CLK, En, reset,
  output reg Q);

always @ (posedge CLK or posedge reset) begin //cambia con valores positivos
  if (reset)
    Q <= 1'b0; //El valor de Q se pone en 0
  else if (En)
    Q <= D;
end
endmodule //FF_D1

//FLIP FLOP de 2 bits
module FF_D2 (
input wire [1:0]D2, CLK, En, reset,
output wire [1:0]Q2);

FF_D1 FF2_1(D2[1], CLK, En, reset, Q2[1]);
FF_D1 FF2_2(D2[0], CLK, En, reset, Q2[0]);
endmodule //FF_D2

//FLIP FLOP de 4 bits
module FF_D4 (
input wire [3:0]D4, CLK, En, reset,
output wire [3:0]Q4);

FF_D2 FF4_1(D4[1:0], CLK, En, reset, Q4[1:0]);
FF_D2 FF4_2(D4[3:2], CLK, En, reset, Q4[3:2]);
endmodule  //FF_D4

//en el siguiente no tengo que poner salida reg, puedo poner un wire:

//ES UN CABLE QUE VA CONECTADO AL CABLE D (LA SALIDA), LA Q ES ENTRADA TAMBIÉN Y D ES LA SALIDA
