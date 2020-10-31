//modulo de Flip flop tipo D de 1 bit
module FF_D (input D, CLK, En, reset,
  output reg Q);

always @ (posedge CLK or posedge reset) begin //cambia con valores positivos
  if (reset)
    Q <=  1'b0; //El valor de Q se pone en 0
 else if (En)
    Q <= D;
end
endmodule //FF_D1


module FF_T (
input wire  CLK, En, reset,
output wire Q);

FF_D FFT (~Q, CLK, En, reset, Q); //La entrada D es la salida Q, pero negada
endmodule //FF_T
