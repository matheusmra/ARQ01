/* 
  Guia_0105.v 
  848813 - Matheus de Almeida Moreira
*/ 
module Guia_0105; 
  // Define data 
  reg [7:0] octal [0:4]; 
  reg [7:0] hex [0:4]; 
  
  // Actions 
  initial begin : main 
    $display("Guia_Conversions - Tests"); 
    $display("\n"); 
    $display("A.) 'PUC-Minas':");
    $display("P = %h", "P"); 
    $display("U = %h", "U"); 
    $display("C = %h", "C"); 
    $display("- = %h", "-"); 
    $display("M = %h", "M");
    $display("i = %h", "i"); 
    $display("n = %h", "n"); 
    $display("a = %h", "a"); 
    $display("s = %h", "s"); 
    $display("\n"); 
    $display("b.) '2025-01':");
    $display("2 = %h", "2");
    $display("0 = %h", "0"); 
    $display("5 = %h", "5"); 
    $display("- = %h", "-"); 
    $display("0 = %h", "0"); 
    $display("1 = %h", "1"); 
    $display("\n"); 
    $display("C.) 'Belo Horizonte - M.G.':");
    $display("B = %b", "B"); 
    $display("e = %b", "e"); 
    $display("l = %b", "l"); 
    $display("o = %b", "o"); 
    $display(" = %b", " "); 
    $display("H = %b", "H"); 
    $display("o = %b", "o");
    $display("r = %b", "r"); 
    $display("i = %b", "i"); 
    $display("z = %b", "z");
    $display("o = %b", "o"); 
    $display("n = %b", "n"); 
    $display("t = %b", "t"); 
    $display("e = %b", "e"); 
    $display(" = %b", " "); 
    $display("- = %h", "-"); 
    $display(" = %b", " "); 
    $display("M = %b", "M");
    $display(". = %b", "."); 
    $display("G = %b", "G"); 
    $display(". = %b", "."); 
    octal[0] = 8'o156; 
    octal[1] = 8'o157; 
    octal[2] = 8'o151; 
    octal[3] = 8'o164; 
    octal[4] = 8'o145; 
    $display("\n"); 
    $display("D.) 156 157 151 164 145 para ASCII:");
    $display("156 (8) = %c", octal[0]); 
    $display("157 (8) = %c", octal[1]); 
    $display("151 (8) = %c", octal[2]); 
    $display("164 (8) = %c", octal[3]); 
    $display("145 (8) = %c", octal[4]); 
    hex[0] = 8'h4D; 
    hex[1] = 8'h61; 
    hex[2] = 8'h6E; 
    hex[3] = 8'h68; 
    hex[4] = 8'h61; 
    $display("\n"); 
    $display("E.) 4D 61 6E 68 61 para ASCII:");
    $display("4D = %s", hex[0]); 
    $display("61 = %s", hex[1]); 
    $display("6E = %s", hex[2]); 
    $display("68 = %s", hex[3]); 
    $display("61 = %s", hex[4]); 
  end // main 

endmodule // Guia_0105