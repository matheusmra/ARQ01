/*
Guia_0305.v
848813 - Matheus de Almeida Moreira
*/

module Guia_0305;
  reg [7:0] a, b, c, d, e;  
  reg [7:0] result_a, result_b, result_c, result_d, result_e; 

  initial begin
    $display("Guia_0305");
    a = 8'b00110110; 
    b = 8'b00001101;
    result_a = a + (~b + 1'b1); 
    $display("a) 110110(2) - 1101(2) = %b(2)", result_a);
    a = 8'b10110110; 
    b = 8'b00011100; 
    result_b = a + (~b + 1'b1);
    $display("b) 101,1011(2) - 3,4(8) = %b(2)", result_b);
    a = 8'b00101101;
    b = 8'b00111010; 
    result_c = a + (~b + 1'b1);
    $display("c) 231(4) - 3A(16) = %b(2)", result_c);
    a = 8'b11010011; 
    b = 8'b01011101; 
    result_d = a + (~b + 1'b1);
    $display("d) D3(16) - 1011101(2) = %b(2)", result_d);
    a = 8'b01011110; 
    b = 8'b00111100; 
    result_e = a + (~b + 1'b1);
    $display("e) 5E(16) - 3C(16) = %b", result_e);
  end
endmodule
