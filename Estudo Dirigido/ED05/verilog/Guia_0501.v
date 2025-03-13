// Matheus de Almeida Moreira - 848813

// -------------------------
// Implementação da expressão (a & ~b) usando apenas portas NOR

module Guia_0501 (
    output s,    // Saída
    input a,     // Entrada a
    input b      // Entrada b
);
    // Definir sinais intermediários
    wire not_b;      // Intermediário para ~b
    wire a_nor_nb;   // Intermediário para a NOR ~b

    // Implementar ~b usando portas NOR
    nor (not_b, b, b); // ~b = b NOR b

    // Implementar a NOR ~b
    nor (a_nor_nb, a, not_b); // a NOR ~b

    // Implementar a & ~b usando portas NOR
    nor (s, a_nor_nb, a_nor_nb); // (a NOR ~b) NOR (a NOR ~b) = a & ~b

endmodule // Guia_0501

// Testbench para o módulo Guia_0501
module testbench;

    // Definir sinais de entrada e saída
    reg a, b;       // Entradas
    wire s;         // Saída

    // Instanciar o módulo Guia_0501
    Guia_0501 uut (
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
