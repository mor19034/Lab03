//PABLO MORENO LEMUS
//19034, sección 11
//TODOS LOS MODULOS DE AQUI SON SOLO LOS COMPONENTES INDIVIDUALES

module counter (input clk, reset, enabled, load, input [11:0] loadData, output reg [11:0] outValue);

    always @ (posedge clk, posedge reset) begin
        if (reset)
            outValue <= 12'b0;
        else if (load)
            outValue <= loadData;
        else if (enabled)
            outValue <= outValue + 1;
    end

endmodule

//PARA ROM
module ROM (input [11:0] address, output [7:0] data);

    reg [7:0] memory [0:4096];

    initial
        $readmemh("memory.list", memory);

    assign data = memory[address];

endmodule//ROM

//ESTO es para los Flip Flops tipo D
module FFD(input clk, reset, En, D, output reg Q);

    always@(posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else if (En)
            Q <= D;
    end
endmodule

//dos bits
module FFD2(input clk, reset, En, input [1:0] D2, output [1:0] Q2);

    FFD a(clk, reset, En, D2[1], Q2[1]);
    FFD b(clk, reset, En, D2[0], Q2[0]);
endmodule

//cuatro bits
module FFD4(input clk, reset, En, input [3:0]D4, output [3:0]Q4);

    FFD2 a(clk, reset, En, D4[3:2], Q4[3:2]);
    FFD2 b(clk, reset, En, D4[1:0], Q4[1:0]);
endmodule

//8 bits con entrada de 8 y dos salidas de 4
module FFD8(input clk, reset, En, input [7:0] D8,
            output [3:0] Q8a,
            output [3:0] Q8b);
    FFD4 a(clk, reset, En, D8[7:4], Q8a); //Las salidas estan separadas debido a que se van a separar en oprnd y instr
    FFD4 b(clk, reset, En, D8[3:0], Q8b);
endmodule

//Este FF es especial para implementar el tipo T
module FFD_T(input clk, reset, D, output reg Q);

    always@(posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

//FLIP FLOP tipo T
module FFT (input clk, reset, output Q);

FFD_T FF_T(clk, reset, ~Q, Q); //La entrada D es la salida Q, pero negada
endmodule //FF_T


//Los buffer=triestado
module Bus_Driver (input En, input [3:0] In, output [3:0] out);

    assign out = En ? In:4'bz;

endmodule //Bus_Driver

//ALU
module ALU(input [3:0] A, B,
           input [2:0] command,
           output C, Ze,
           output [3:0] S);

    reg [4:0] Q;

    always @ (A, B, command)
        case (command)
            3'b000: Q = A; //Dejar pasar A
            3'b001: Q = A - B; //Comparar
            3'b010: Q = B; //Dejar pasar B
            3'b011: Q = A + B; //Sumar A y B
            3'b100: Q = {1'b0, ~(A & B)}; //NAND
            default: Q = 5'b10101;
        endcase

    assign S = Q[3:0];
    assign C = Q[4];
    assign Ze = ~(Q[3] | Q[2] | Q[1] | Q[0]);

endmodule

//REVISALO Y CAMBIALE LAS VARIABLES WUUUUUUUUUUU
//RAM
module RAM(
    input wire cs, we,
    input wire [11:0]addres,
    output wire [3:0]Data);

    reg [3:0]RAM[0:4095]; // Aca se define el tamaño de la RAM
    reg [3:0]dataout; // Se declaran las salidas de la RAM
    assign Data = (cs && ~we) ? dataout: 4'bzzzz; // Se indica cuando esta en alta impedancia

    always @(cs, we, addres, Data) begin // Se inicializa un always

        if (cs && ~we)
            dataout = RAM[addres];
        if (cs && we)
            RAM[addres] = Data;

        end
endmodule

//Modulo para el decode
module Decode(
    input wire [6:0] in,
    output wire [12:0] outD);

    reg [12:0] out;

    always @ (in)
        casez(in)
            // any
            7'b????_??0: out <= 13'b1000_000_001000;
            // JC
            7'b0000_1?1: out <= 13'b0100_000_001000;
            7'b0000_0?1: out <= 13'b1000_000_001000;
            // JNC
            7'b0001_1?1: out <= 13'b1000_000_001000;
            7'b0001_0?1: out <= 13'b0100_000_001000;
            // CMPI
            7'b0010_??1: out <= 13'b0001_001_000010;
            // CMPM
            7'b0011_??1: out <= 13'b1001_001_100000;
            // LIT
            7'b0100_??1: out <= 13'b0011_010_000010;
            // IN
            7'b0101_??1: out <= 13'b0011_010_000100;
            // LD
            7'b0110_??1: out <= 13'b1011_010_100000;
            // ST
            7'b0111_??1: out <= 13'b1000_000_111000;
            // JZ
            7'b1000_?11: out <= 13'b0100_000_001000;
            7'b1000_?01: out <= 13'b1000_000_001000;
            // JNZ
            7'b1001_?11: out <= 13'b1000_000_001000;
            7'b1001_?01: out <= 13'b0100_000_001000;
            // ADDI
            7'b1010_??1: out <= 13'b0011_011_000010;
            // ADDM
            7'b1011_??1: out <= 13'b1011_011_100000;
            // JMP
            7'b1100_??1: out <= 13'b0100_000_001000;
            // OUT
            7'b1101_??1: out <= 13'b0000_000_001001;
            // NANDI
            7'b1110_??1: out <= 13'b0011_100_000010;
            // NANDM
            7'b1111_??1: out <= 13'b1011_100_100000;
            default: out <= 13'b1111111111111;
        endcase

    assign outD = out;
endmodule

//----------------------------------------------------------------
//----------------------------------------------------------------
//ESTE MODULO ES LA INTERCONECCION DE TODOS LOS MODULOS INDIVIDUALES
module uP (
  input clock, reset,
  input [3:0] pushbuttons,
  output phase, c_flag, z_flag,
  output [3:0] instr, oprnd, data_bus, FF_out, accu,
  output [7:0] program_byte,
  output [11:0] PC, address_RAM);

  wire bus_out, C, Ze;
  wire [3:0] alu_out;
  wire [6:0] decode_in;
  wire [12:0] decode_out;

  assign address_RAM = {oprnd, program_byte};
  assign decode_in = {instr, c_flag, z_flag, phase};

  counter cont(.clk(clock), .reset(reset), .enabled(decode_out[12]), .load(decode_out[11]), .loadData(address_RAM), .outValue(PC));
  ROM rom(PC, program_byte);
  FFD8 Fetch(.clk(clock), .reset(reset), .En(~phase), .D8(program_byte), .Q8a(instr), .Q8b(oprnd));
  FFD2 flags(.clk(clock), .reset(reset), .En(decode_out[9]), .D2({C, Ze}), .Q2({c_flag, z_flag}));
  FFT fase(.clk(clock), .reset(reset), .Q(phase));
  Decode decoder(decode_in, decode_out);
  RAM ram(.addres(address_RAM), .cs(decode_out[5]), .we(decode_out[4]), .Data(data_bus));
  ALU alu(.A(accu), .B(data_bus), .command(decode_out[8:6]), .C(C), .Ze(Ze), .S(alu_out));
  FFD4 ACCU(.clk(clock), .reset(reset), .En(decode_out[10]), .D4(alu_out), .Q4(accu));
  FFD4 Out(.clk(clock), .reset(reset), .En(decode_out[0]), .D4(data_bus), .Q4(FF_out));
  //Buses
  Bus_Driver busOprnd(.En(decode_out[1]), .In(oprnd), .out(data_bus));
  Bus_Driver busIn(.En(decode_out[2]), .In(pushbuttons), .out(data_bus));
  Bus_Driver busAlu(.En(decode_out[3]), .In(alu_out), .out(data_bus));
endmodule //uP
