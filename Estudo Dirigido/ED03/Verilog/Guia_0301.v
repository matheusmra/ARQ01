/*
Guia_0301.v
848813 - Matheus de Almeida Moreira
*/

module Guia_0301;

// Define data
reg [5:0] a = 6'b00_1011;  // 1011 ajustado para 6 bits
reg [7:0] b = 8'b00_1100;  // 1100 ajustado para 8 bits
reg [5:0] c = 6'b100011;   // Já está em 6 bits
reg [6:0] d = 7'b101001;   // Ajustado para 7 bits
reg [7:0] e = 8'b111010;   // Ajustado para 8 bits

// Armazenar os resultados
reg [5:0] c1_a;
reg [7:0] c1_b;
reg [5:0] c2_c;
reg [6:0] c2_d;
reg [7:0] c2_e;

// Actions
initial begin : main
    $display("Guia_0301 - Tests");

    // Calcular complemento de 1 e complemento de 2
    c1_a = ~a;
    c1_b = ~b;
    c2_c = ~c + 1;
    c2_d = ~d + 1;
    c2_e = ~e + 1;

    // Exibir resultados
    $display("a = %6b(2) -> C1(a) = %6b(2)", a, c1_a);
    $display("b = %8b(2) -> C1(b) = %8b(2)", b, c1_b);
    $display("c = %6b(2) -> C2(c) = %6b(2)", c, c2_c);
    $display("d = %7b(2) -> C2(d) = %7b(2)", d, c2_d);
    $display("e = %8b(2) -> C2(e) = %8b(2)", e, c2_e);
end // main

endmodule // Guia_0301
