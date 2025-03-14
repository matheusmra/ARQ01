// Matheus de Almeida Moreira - 848813

// Implementacao da expressao ~(a & ~b) usando apenas portas NAND
module Guia_0504 (
    output s,    // Saida
    input a,     // Entrada a
    input b      // Entrada b
);

    // Definir sinais intermediarios
    wire nb;       // Intermediario para ~b
    wire a_and_nb; // Intermediario para a & ~b

    // Implementar ~b usando portas NAND
    nand (nb, b, b);  // ~b = b NAND b

    // Implementar a & ~b usando apenas NAND
    nand (a_and_nb, a, nb);
    nand (a_and_nb, a_and_nb, a_and_nb); // a & ~b = (a NAND ~b) NAND (a NAND ~b)

    // Implementar ~(a & ~b) usando NAND
    nand (s, a_and_nb, a_and_nb); // ~(a & ~b) = (a & ~b) NAND (a & ~b)

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