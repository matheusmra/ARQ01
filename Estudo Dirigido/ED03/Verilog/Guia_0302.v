/*
Guia_0301.v
848813 - Matheus de Almeida Moreira
*/

module Guia_0302;

// Definir os dados convertidos corretamente
reg [5:0] a = 6'b011011;        // 123(4) -> 6 bits
reg [7:0] b = 8'b11000100;      // C4(16) -> 8 bits
reg [5:0] c = 6'b110110;        // 312(4) -> 6 bits
reg [9:0] d = 10'b001101011;  // 153(8) -> 10 bits (completo com 9 bits)
reg [7:0] e = 8'b01111101;      // 7D(16) -> 8 bits

// Armazenar os resultados
reg [5:0] c1_a;
reg [7:0] c1_b;
reg [5:0] c2_c;
reg [9:0] c2_d;
reg [7:0] c2_e;

// Actions
initial begin : main
    $display("Guia_0301 - Tests");

    // a) Complemento de 1 de 123(4) -> 6 bits
    c1_a = ~a;  // Complemento de 1 de 6 bits
    
    // b) Complemento de 1 de C4(16) -> 8 bits
    c1_b = ~b;  // Complemento de 1 de 8 bits
    
    // c) Complemento de 2 de 312(4) -> 6 bits
    c2_c = ~c + 1;  // Complemento de 2 de 6 bits
    
    // d) Complemento de 2 de 153(8) -> 10 bits
    c2_d = ~d + 1;  // Complemento de 2 de 10 bits
    
    // e) Complemento de 2 de 7D(16) -> 8 bits
    c2_e = ~e + 1;  // Complemento de 2 de 8 bits

    // Exibir os resultados
    $display("123(4) = %6b(2) -> C1(6) = %6b(2)", a, c1_a);
    $display("C4(16) = %8b(2) -> C1(8) = %8b(2)", b, c1_b);
    $display("312(4) = %6b(2) -> C2(6) = %6b(2)", c, c2_c);
    $display("153(8) = %10b(2) -> C2(10) = %10b(2)", d, c2_d);
    $display("7D(16) = %8b(2) -> C2(8) = %8b(2)", e, c2_e);
end // main

endmodule // Guia_0302
