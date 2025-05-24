// Matheus de Almeida Moreira
// 848813
`timescale 1ns/1ps

module JK_FF (
    input clk, j, k,
    output reg q
);
    initial begin 
        q = 1'b0;
    end

    always @(negedge clk) begin
        case ({j, k})
            2'b00: q <= q;      // Sem mudança
            2'b01: q <= 1'b0;   // Reset
            2'b10: q <= 1'b1;   // Set
            2'b11: q <= ~q;     // Toggle
        endcase
    end
endmodule

module contador_decrescente_6bits (
    input clk,      // Clock externo
    output [5:0] Q  // Saída do contador
);
    wire [5:0] q_int;
    wire [5:0] q_bar_int; 

    // J = K = 1 em todos os FFs (modo toggle)
    wire one = 1'b1;

    // Flip-flop 0 recebe clock externo
    JK_FF ff0 (
        .clk(clk),
        .j(one),
        .k(one),
        .q(q_int[0])
    );
    assign q_bar_int[0] = ~q_int[0]; // Saída invertida de Q0

    // Flip-flop 1
    JK_FF ff1 (
        .clk(q_bar_int[0]), 
        .j(one),
        .k(one),
        .q(q_int[1])
    );
    assign q_bar_int[1] = ~q_int[1]; // Saída invertida de Q1

    // Flip-flop 2
    JK_FF ff2 (
        .clk(q_bar_int[1]),
        .j(one),
        .k(one),
        .q(q_int[2])
    );
    assign q_bar_int[2] = ~q_int[2]; // Saída invertida de Q2

    // Flip-flop 3
    JK_FF ff3 (
        .clk(q_bar_int[2]), 
        .j(one),
        .k(one),
        .q(q_int[3])
    );
    assign q_bar_int[3] = ~q_int[3]; // Saída invertida de Q3

    // Flip-flop 4
    JK_FF ff4 (
        .clk(q_bar_int[3]), 
        .j(one),
        .k(one),
        .q(q_int[4])
    );
    assign q_bar_int[4] = ~q_int[4]; // Saída invertida de Q4

    // Flip-flop 5
    JK_FF ff5 (
        .clk(q_bar_int[4]), // CORRIGIDO: Usa Q_BAR do FF anterior
        .j(one),
        .k(one),
        .q(q_int[5])
    );

    assign Q = q_int;
endmodule

module tb_contador_decrescente_6bits;

    reg clk_tb; 
    wire [5:0] Q_tb; 
    contador_decrescente_6bits uut (
        .clk(clk_tb),
        .Q(Q_tb)
    );
    initial begin
        clk_tb = 1'b0; 
        forever #5 clk_tb = ~clk_tb;
    end
    initial begin
        #1; 
        $display("Tempo\tCLK\tQ[5:0] (Decimal)");
        $monitor("%4dns\t%b\t%06b (%2d)", $time, clk_tb, Q_tb, Q_tb);
        #650 $finish;
    end

endmodule