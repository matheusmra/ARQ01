/*
Guia_0303_Complemento.v
999999 - Xxx Yyy Zzz
*/

module Guia_0303_Complemento;
// define data
reg [4:0] a = 5'b10101;        // 10101(2) em 5 bits
reg [5:0] b = 6'b110101;       // 110101(2) em 6 bits
reg [5:0] c = 6'b100110;       // 100110(2) em 6 bits
reg [6:0] d = 7'b1010111;      // 1010111(2) em 7 bits
reg [6:0] e = 7'b1110101;      // 1110101(2) em 7 bits

// actions
initial
begin : main
  $display ("Guia_0303 - Complementos de dois");

  // Calcular complemento de dois para 'a'
  // Passo 1: Subtrair 1, Passo 2: Inverter os bits
  $display ("a) 10101(2) -> Complemento de dois: %0d(10)", (~(a - 1) & 5'b11111));

  // Calcular complemento de dois para 'b'
  // Passo 1: Subtrair 1, Passo 2: Inverter os bits
  $display ("b) 110101(2) -> Complemento de dois: %0d(10)", (~(b - 1) & 6'b111111));

  // Calcular complemento de dois para 'c'
  // Passo 1: Subtrair 1, Passo 2: Inverter os bits
  $display ("c) 100110(2) -> Complemento de dois: 0%0b(2)", (~(c - 1) & 6'b111111));

  // Calcular complemento de dois para 'd'
  // Passo 1: Subtrair 1, Passo 2: Inverter os bits
  $display ("d) 1010111(2) -> Complemento de dois: 0%0b(2)", (~(d - 1) & 7'b1111111));

  // Calcular complemento de dois para 'e'
  // Passo 1: Subtrair 1, Passo 2: Inverter os bits
  $display ("e) 1110101(2) -> Complemento de dois: %0h(16)", (~(e - 1) & 7'b1111111));
  
end // main end
endmodule // Guia_0303_Complemento
