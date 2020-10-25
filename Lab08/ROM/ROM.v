//Este es el codigo para la memoria ROM

module ROM (
  input wire [11:0]address, //Las entradas de la memoria
  output wire [7:0]data); //Las salidas de la memoria

reg [7:0] ROM_m[0:4095]; //El tamaño de la memoria, palabra de 8 bits
//Profundidad de  2^12, es decir, 4096 localidades

initial begin
  $readmemh("ejemplo_ROM.list", ROM_m); //Se lee lo que hay en la memoria
end
assign data = ROM_m[address]; //Se extrae lo que hay en la dirrecion
//de la memoria y se le da un valor

endmodule //ROM
