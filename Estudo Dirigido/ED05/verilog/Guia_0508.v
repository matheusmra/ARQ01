// Matheus de Almeida Moreira - 848813

// Implementacao da expressao (~a | ~b) usando apenas portas NAND
module Guia_0508 (
    output s,    // Saida
    input a,     // Entrada a
    input b      // Entrada b
);

    // Definir sinais intermediarios
    wire na;  // Intermediario para ~a
    wire nb;  // Intermediario para ~b
    wire na_nand_nb; // Intermediario para ~a NAND ~b

    // Implementar ~a e ~b usando portas NAND
    nand (na, a, a);  // ~a = a NAND a
    nand (nb, b, b);  // ~b = b NAND b

    // Implementar ~a | ~b usando apenas portas NAND
    nand (s, na, nb); // ~a | ~b = ~a NAND ~b

endmodule // Guia_0508

// Testbench para o modulo Guia_0508
module testbench;

    // Definir sinais de entrada e saida
    reg a, b;       // Entradas
    wire s;         // Saída

    // Instanciar o modulo Guia_0508
    Guia_0508 uut (
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
        $monitor("Tempo = %0t | a = %b, b = %b, s = %b", $time, a, b, s);
    end

endmodule
