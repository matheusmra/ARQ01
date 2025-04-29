// Matheus de Almeida Moreira - 848813

// ------------------------------
// Módulo A: sa = mux(not(b), b, a)
// ------------------------------
module Mux (
    output sa,
    input a, b
);

    wire not_b, not_a;
    wire and1, and2;

    // Inversões
    not (not_b, b);
    not (not_a, a);

    // ~b AND ~a
    and (and1, not_b, not_a);

    // b AND a
    and (and2, b, a);

    // OR das duas condições
    or (sa, and1, and2);

endmodule // MuxLogic

// ------------------------------
// Módulo B: sb = NAND(NAND(NAND(a,a),b), NAND(c,NAND(b,b)))
// ------------------------------
module Nand (
    output sb,
    input a, b, c
);

    wire nota, notb;
    wire x1, x2;

    // nota = ~a
    nand (nota, a, a);

    // notb = ~b
    nand (notb, b, b);

    // x1 = ~(~a & b)
    nand (x1, nota, b);

    // x2 = ~(c & ~b)
    nand (x2, c, notb);

    // sb = ~(x1 & x2)
    nand (sb, x1, x2);

endmodule // Nand

// ------------------------------
// Testbench para os dois módulos
// ------------------------------
module testbench;

    reg a, b, c;
    wire sa, sb;

    // Instancia os módulos
    Mux modA (.sa(sa), .a(a), .b(b));
    Nand modB (.sb(sb), .a(a), .b(b), .c(c));

    initial begin
        // Exibe a tabela verdade do MUX
        $display("Tabela Verdade do MUX:");
        $display(" a b | sa ");
        $display("------|----");

        // Testa todas as combinações de a e b para o MUX
        a = 0; b = 0; #10;
        $display(" %b %b |  %b", a, b, sa);
        a = 0; b = 1; #10;
        $display(" %b %b |  %b", a, b, sa);
        a = 1; b = 0; #10;
        $display(" %b %b |  %b", a, b, sa);
        a = 1; b = 1; #10;
        $display(" %b %b |  %b", a, b, sa);

        $display("\n");

        // Exibe a tabela verdade do NAND
        $display("Tabela Verdade do NAND:");
        $display(" a b c | sb ");
        $display("--------|----");

        // Testa todas as combinações de a, b e c para o NAND
        a = 0; b = 0; c = 0; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);
        a = 0; b = 0; c = 1; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);
        a = 0; b = 1; c = 0; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);
        a = 0; b = 1; c = 1; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);
        a = 1; b = 0; c = 0; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);
        a = 1; b = 0; c = 1; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);
        a = 1; b = 1; c = 0; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);
        a = 1; b = 1; c = 1; #10;
        $display(" %b %b %b |  %b", a, b, c, sb);

        $finish;
    end

endmodule
