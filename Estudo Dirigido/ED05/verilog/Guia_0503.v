// Matheus de Almeida Moreira - 848813

// Implementacao da expressao ~(a | ~b) usando apenas portas NOR
module Guia_0503 (
    output s,    // Saida
    input a,     // Entrada a
    input b      // Entrada b
);

    // Definir sinais intermediarios
    wire nb;      // Intermediario para ~b
    wire a_or_nb; // Intermediario para a | ~b

    // Implementar ~b usando portas NOR
    nor (nb, b, b);  // ~b = b NOR b

    // Implementar a | ~b usando NOR
    nor (a_or_nb, a, nb);  // a | ~b = a NOR ~b

    // Implementar ~(a | ~b) usando NOR
    nor (s, a_or_nb, a_or_nb); // ~(a | ~b) = (a | ~b) NOR (a | ~b)

endmodule // Guia_0503

// Testbench para o modulo Guia_0503
module testbench;

    // Definir sinais de entrada e saida
    reg a, b;       // Entradas
    wire s;         // Saida

    // Instanciar o modulo Guia_0503
    Guia_0503 uut (
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
