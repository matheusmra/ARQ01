// Matheus de Almeida Moreira - 848813

// Implementacao da expressao ~(a ^ b) usando apenas portas NAND
module Guia_0504 (
    output s,    // Saida
    input a,     // Entrada a
    input b      // Entrada b
);

    // Definir sinais intermediarios
    wire na, nb;      // Intermediarios para ~a e ~b
    wire a_nand_b;  // Intermediario para a NAND b
    wire na_nand_nb; // Intermediario para ~a NAND ~b
    
    // Implementar ~a e ~b usando NAND
    nand (na, a, a);  // ~a = a NAND a
    nand (nb, b, b);  // ~b = b NAND b
    
    // Implementar a NAND ~b
    wire a_nand_nb;
    nand (a_nand_nb, a, nb);
    
    // Implementar ~a NAND b
    wire na_nand_b;
    nand (na_nand_nb, na, b);
    
    // Implementar ~(a & ~b) usando NAND
    nand (s, a_nand_nb, na_nand_nb);
    
endmodule // Guia_0504

// Testbench para o modulo Guia_0504
module testbench;

    // Definir sinais de entrada e saida
    reg a, b;       // Entradas
    wire s;         // Saida

    // Instanciar o modulo Guia_0504
    Guia_0504 uut (
        .s(s),
        .a(a),
        .b(b)
    );

    // Procedimento inicial
    initial begin
        // Inicializar entradas
        a = 0;
        b = 0;

        // Testar diferentes combinacoes de entradas
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10;

        // Encerrar simulacao
        $finish;
    end

    // Monitorar saidas
    initial begin
        $monitor("Tempo = %0t, a = %b, b = %b, s = %b", $time, a, b, s);
    end

endmodule