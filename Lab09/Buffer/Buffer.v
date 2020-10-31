module BUFt (
  input wire En,
  input wire [3:0]In,
  output wire [3:0]Out);

    assign Out = (En) ? In:4'bz;
endmodule //BUFt
