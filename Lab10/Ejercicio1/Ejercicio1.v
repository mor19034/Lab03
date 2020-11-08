//CONTADOR
module contador (
  input wire CLK, reset, En, LA, //En es el Enabled y LA es el bit que activa el Load.
  input wire [11:0]load,
  output reg [11:0]Out);

always @ (posedge CLK or posedge reset or LA or load)begin //El always se va a ejecutar si LA esta en 1 o 0
    if (reset) //El contador se pone en 0
      Out <= 12'b000000000000;
    else if (LA) //Permite que se le diga en que valor empezar
      Out <= load;
    else if (En) //Se inicia el conteo
      Out <= Out + 1;
  end
endmodule //CONTADOR



//PARA ROM
module ROM(
  input wire [11:0]address, //Las entradas de la memoria
  output wire [7:0]data); //Las salidas de la memoria

reg [7:0] ROM_m[0:4095]; //El tamaño de la memoria, palabra de 8 bits
//Profundidad de  2^12, es decir, 4096 localidades

initial begin
  $readmemh("ejercicio1.procesador", ROM_m); //Se lee lo que hay en la memoria
end
assign data = ROM_m[address]; //Se extrae lo que hay en la dirrecion
//de la memoria y se le da un valor

endmodule //ROM



//ESTO ES SOLO PARA EL FETCH
module FFD(input wire clk, reset, En, D, output reg Q);

    always@(posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else if (En)
            Q <= D;
    end
endmodule

//dos bits
module FFD2(input wire clk, reset, En,
            input wire [1:0]D2,
            output wire [1:0]Q2);

    FFD a(clk, reset, En, D2[1], Q2[1]);
    FFD b(clk, reset, En, D2[0], Q2[0]);
endmodule

//cuatro bits
module FFD4(input wire clk, reset, En,
            input wire [3:0]D4,
            output wire [3:0]Q4);

    FFD2 a(clk, reset, En, D4[3:2], Q4[3:2]);
    FFD2 b(clk, reset, En, D4[1:0], Q4[1:0]);
endmodule

//8 bits con entrada de 8 y dos salidas de 4
module Fetch(input wire clk, reset, En,
            input wire [7:0]D8,
            output wire [3:0]Q8a,
            output wire [3:0]Q8b);
    FFD4 a(clk, reset, En, D8[7:4], Q8a);
    FFD4 b(clk, reset, En, D8[3:0], Q8b);
endmodule


//MODULO PARA UNIR LOS MODULOS
module ejercicio1 (
  input wire clk, RESET ,ENC, ENload, ENF,
  input wire [11:0]Load,
  output wire [3:0]instr,
  output wire [3:0]oprnd,
  output wire [7:0]program_byte);

    wire [11:0]PC;

    contador C1(clk, RESET, ENC, ENload, Load, PC);
    ROM R1(PC, program_byte);
    Fetch FET(clk, RESET, ENF, program_byte, instr, oprnd);
endmodule //ejercicio1
