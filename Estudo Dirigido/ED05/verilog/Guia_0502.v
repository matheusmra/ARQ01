// Matheus de Almeida Moreira - 848813

// Implementação da expressão (~a | b) usando apenas portas NAND
module Guia_0502 (
    output s,    // Saída
    input a,     // Entrada a
    input b      // Entrada b
);

    // Definir sinais intermediários
    wire na, nb, na_nand_nb;

    // Implementar ~a e ~b usando portas NAND
    nand (na, a, a);  // ~a = a NAND a
    nand (nb, b, b);  // ~b = b NAND b

    // Implementar ~a NAND b
    nand (na_nand_nb, na, b);

    // Implementar ~a | b
    nand (s, na_nand_nb, na_nand_nb); // (~a NAND b) NAND (~a NAND b) = ~a | b

endmodule // Guia_0502

// Testbench para o módulo Guia_0502
module testbench;

    // Definir sinais de entrada e saída
    reg a, b;       // Entradas
    wire s;         // Saída

    // Instanciar o módulo Guia_0502
    Guia_0502 uut (
        .s(s),
        .a(a),
        .b(b)
    );

    // Procedimento inicial
    initial begin
        // Inicializar entradas
        a = 0;
        b = 0;

        // Testar diferentes combinações de entradas
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10;

        // Encerrar simulação
        $finish;
    end

    // Monitorar saídas
    initial begin
        $monitor("Tempo = %0t, a = %b, b = %b, s = %b", $time, a, b, s);
    end

endmodule
