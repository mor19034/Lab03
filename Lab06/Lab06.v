//modulo de Flip flop tipo D
module FF_D ([0:3], CLK, Q[0:3], set, reset);
  input D[0:3], CLK, reset, set;
  output reg Q[0:3];

//reset asincrono
always @ (posedge CLK or posedge reset )
  if reset == 1b'1 begin
    Q[0:3] <= 4b'0000;
end else begin Q[0:3] <= 4b'0000;
    Q[0:3] <= D[0:3];
  if reset == 0;

//Set sincrono
  if set ==1'b begin
    Q<= 4b'1111;
  else
    Q[0:3] <= D[0:3];

endmodule


//Caja negra de primer ejercicio

module CN1(input wire A, B, S0, S1,  output wire, s0, s1, Y1);
  wire NA, NB, NS0, NS1;
  assign NA = ~A;
  assign NB = ~B;
  assign NS0 = ~S0;
  assign NS1 = ~S1;
  assign s1 = (S0 & B & A)|(S1 & B);
  assign s0 = A & NS0 & NS1;
  assign Y1 = A & B & S0;
endmodule
//ni idea de como usar el flip flop

// Caja negra de segundo ejercicio

module CN2(input wire A, S0, S1, S2,  output wire, s0, s1, s2, Y2, Y3, Y4);
  wire NA, NS0, NS1, NS2;
  assign NA = ~A;
  assign NS2 = ~S2;
  assign NS0 = ~S0;
  assign NS1 = ~S1;
  assign s0 = (NS0 & S1 & S2 & A)|(NS0 & NS1 & NS2 & NA)|(S0 & S2 & NA)|(S0 & NS1 & A)|(S0 & S1 & NS2);
  assign s1 = (S1 & S2 & NA) | (NS1 & S2 & A) | (NS1 & NS2 & NA) | (S1 & NS2 & A);
  assign s2 = NS2;
  assign Y2 = S0;
  assign Y3 = (NS0 & S1) | (S0 & NS1);
  assign Y4 = (S1 & NS2) | (NS1 & S2);

endmodule
