module PoS (
    input A, B, C,
    output F
);
    assign F = (A | B | ~C) &
               (A | ~B | ~C) &
               (~A | ~B | C) &
               (~A | ~B | ~C);
endmodule

module test_PoS;
    reg A, B, C;
    wire F;

    PoS uut (.A(A), .B(B), .C(C), .F(F));

    initial begin
        $display("A B C | F");
        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i;
            #1 $display("%b %b %b | %b", A, B, C, F);
        end
    end
endmodule
