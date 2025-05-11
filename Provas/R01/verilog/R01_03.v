// Matheus de Almeida Moreira - 848813

// f = (~a & d) | (a & ~b)
module Expr03a (
    output f,
    input a, b, d
);

    wire nota, notb;
    wire and1, and2;

    not (nota, a);
    not (notb, b);
    and (and1, nota, d);
    and (and2, a, notb);
    or (f, and1, and2);

endmodule

// f = (a'.c'.d)+(a.b')+(b'.d)

module Expr03b (
    output f,
    input a, b, c, d
);

    wire nota, notb, notc;
    wire and1, and2, and3;

    not (nota, a);
    not (notb, b);
    not (notc, c);

    and (and1, nota, notc, d);
    and (and2, a, notb);
    and (and3, notb, d);

    or (f, and1, and2, and3);

endmodule

// Testbench - Exercício 03
module testbench;

    reg a, b, c, d;
    wire f03a, f03b;

    Expr03a modA (.f(f03a), .a(a), .b(b), .d(d));
    Expr03b modB (.f(f03b), .a(a), .b(b), .c(c), .d(d));

    initial begin
        $display("Tabela Verdade - 03a: (~a & d) | (a & ~b)");
        $display(" a b d | f03a ");
        $display("--------|------");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, d} = i;
            #1;
            $display(" %b %b %b |  %b", a, b, d, f03a);
        end

        $display("\nTabela Verdade - 03b: (a'.c'.d)+(a.b')+(b'.d)");
        $display(" a b c d | f03b ");
        $display("-----------|------");
        for (integer i = 0; i < 16; i = i + 1) begin
            {a, b, c, d} = i;
            #1;
            $display(" %b %b %b %b |  %b", a, b, c, d, f03b);
        end

        $finish;
    end

endmodule
