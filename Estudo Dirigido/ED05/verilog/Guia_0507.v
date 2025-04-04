// Matheus de Almeida Moreira - 848813

// Implementacao da expressao ~(~a ^ ~b) usando apenas portas NOR
module Guia_0507 (
    output s,    // Saida
    input a,     // Entrada a
    input b      // Entrada b
);

    // Definir sinais intermediarios
    wire na, nb;      // Intermediarios para ~a e ~b
    wire na_nor_nb;   // Intermediario para ~a NOR ~b

    // Implementar ~a e ~b usando NOR
    nor (na, a, a);  // ~a = a NOR a
    nor (nb, b, b);  // ~b = b NOR b
    
    // Implementar ~a NOR ~b
    nor (na_nor_nb, na, nb);
    
    // Implementar ~(~a ^ ~b) usando NOR
    nor (s, na_nor_nb, na_nor_nb); // ~(~a ^ ~b) = (~a NOR ~b) NOR (~a NOR ~b)

endmodule // Guia_0507

// Testbench para o modulo Guia_0507
module testbench;

    // Definir sinais de entrada e saida
    reg a, b;       // Entradas
    wire s;         // Saida

    // Instanciar o modulo Guia_0507
    Guia_0507 uut (
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
