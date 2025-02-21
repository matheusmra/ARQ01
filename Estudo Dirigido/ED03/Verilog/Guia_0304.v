/*
Guia_0304.v 
Autor: Matheus de Almeida Moreira
*/

module Guia_0301;

// Definição dos números em diferentes bases
reg signed [4:0] a1 = 5'b11101;  
reg signed [4:0] b1 = 5'b01101;  

reg signed [7:0] a2 = 8'b10110010; 
reg signed [7:0] b2 = 8'b10010000; 

reg signed [8:0] a3 = 9'b011010001; 
reg signed [8:0] b3 = 9'b010001011; 

reg signed [9:0] a4 = 10'b011101100; 
reg signed [9:0] b4 = 10'b010110101; 

reg signed [12:0] a5 = 13'b011010100010; 
reg signed [12:0] b5 = 13'b110000010100; 


reg signed [4:0] c2_b1;
reg signed [7:0] c2_b2;
reg signed [8:0] c2_b3;
reg signed [9:0] c2_b4;
reg signed [12:0] c2_b5;

// Resultados das operações
reg signed [4:0] r1;
reg signed [7:0] r2;
reg signed [8:0] r3;
reg signed [9:0] r4;
reg signed [12:0] r5;

initial begin : main
    $display("Guia_0304");

    // Calculando complemento de dois
    c2_b1 = ~b1 + 1;
    c2_b2 = ~b2 + 1;
    c2_b3 = ~b3 + 1;
    c2_b4 = ~b4 + 1;
    c2_b5 = ~b5 + 1;


    r1 = a1 + c2_b1;
    r2 = a2 + c2_b2;
    r3 = a3 + c2_b3;
    r4 = a4 + c2_b4;
    r5 = a5 + c2_b5;

    $display("11101(2) - 1101(2) = %5b(2)", r1);
    $display("10110010(2) - 10010000(2) = %8b(2)", r2);

    $display("321(4) - 213(4) = %b(4)", r3); 

    $display("354(8) - 265(8) = %0o(8)", r4); 

    $display("6A2(16) - C14(16) = %0h(16)", r5);
end

endmodule // Guia_0301
