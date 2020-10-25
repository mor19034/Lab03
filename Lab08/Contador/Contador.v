//Contador de 15 bits

module contador (
  input wire CLK, reset, En, LA, //En es el Enabled y LA es el bit que activa el Load.
  input wire [11:0]load,
  output reg [11:0]Out);

always @ (posedge CLK or posedge reset or LA or load)begin //El always se va a ejecutar si LA esta en 1 o 0
  if (reset) //El contador se pone en 0
    Out <= 12'b000000000000;

  else if (LA) //Permite que el valor de Load sea el valor con el que se quedó la salida
    Out <= load;

  else if (En) //Se inicia el conteo
    Out <= Out + 1;

end
endmodule //contador
