// Matheus de Almeida Moreira - 848813

// ------------------------------
// Expr04: f = ~(~a + (b & c))
// ------------------------------
module Expr04 (
    output f,
    input a, b, c
);

    wire nota, andbc, or1;

    not (nota, a);
    and (andbc, b, c);
    or (or1, nota, andbc);
    not (f, or1);

endmodule

// ------------------------------
// Expr04_Nand: expressão equivalente com NANDs
// f = ~(~a + (b & c)) usando apenas NAND
// ------------------------------
module Expr04_Nand (
    output f,
    input a, b, c
);

    wire nota, nand_bc, not_bc, or_nand;

    nand (nota, a, a);              // ~a
    nand (nand_bc, b, c);           // ~(b & c)
    nand (not_bc, nand_bc, nand_bc); // (b & c)
    nand (or_nand, nota, not_bc);   // ~a & (b & c)
    nand (f, or_nand, or_nand);     // negação final

endmodule

// ------------------------------
// Testbench - Exercício 04
// ------------------------------
module testbench;

    reg a, b, c;
    wire f04, f04nand;

    Expr04 modA (.f(f04), .a(a), .b(b), .c(c));
    Expr04_Nand modB (.f(f04nand), .a(a), .b(b), .c(c));

    initial begin
        $display("Tabela Verdade - Expr04: ~(~a + (b & c))");
        $display(" a b c | f04 ");
        $display("--------|------");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i;
            #1;
            $display(" %b %b %b |  %b", a, b, c, f04);
        end

        $display("\nTabela Verdade - Expr04 com NANDs");
        $display(" a b c | f04nand ");
        $display("--------|---------");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i;
            #1;
            $display(" %b %b %b |    %b", a, b, c, f04nand);
        end

        $finish;
    end

endmodule
