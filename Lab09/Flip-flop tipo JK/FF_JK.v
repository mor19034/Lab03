module FF_D (
  input D, CLK, En, reset,
  output reg Q);

always @ (posedge CLK or posedge reset) begin //cambia con valores positivos
  if (reset)
    Q <=  1'b0; //El valor de Q se pone en 0
 else if (En)
    Q <= D;
end
endmodule //FF_D1

//Este es el modulo para el Flip Flop JK
module FF_JK (
  input wire J, K, CLK, En, reset,
  output wire Qprev);

wire JC, KC, q, KN, QN;

not(KN,K);
not(QN, Qprev);
and(KC, Qprev, KN);
and(JC, J, QN);
or(q, KC, JC);

FF_D FFJK(q, CLK, En, reset, Qprev);
endmodule //FF_JK
