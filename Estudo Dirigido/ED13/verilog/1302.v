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

    always @(negedge clk) begin // Sensível à borda de DESCIDA do clock
        case ({j, k})
            2'b00: q <= q;      // Sem mudança
            2'b01: q <= 1'b0;   // Reset
            2'b10: q <= 1'b1;   // Set
            2'b11: q <= ~q;     // Toggle
        endcase
    end
endmodule

module contador_crescente_6bits (
    input clk_principal, // Clock externo principal
    output [5:0] Q        // Saída do contador (Q5 Q4 Q3 Q2 Q1 Q0)
);
    // Fios internos para as saídas Q de cada flip-flop
    wire q0_out, q1_out, q2_out, q3_out, q4_out, q5_out;
    // J = K = 1 em todos os FFs para modo toggle
    wire jk_mode = 1'b1;
    // FF0 
    JK_FF ff0 (
        .clk(clk_principal),
        .j(jk_mode),
        .k(jk_mode),
        .q(q0_out)
    );

    // FF1 
    JK_FF ff1 (
        .clk(q0_out), // Para contador CRESCENTE
        .j(jk_mode),
        .k(jk_mode),
        .q(q1_out)
    );

    // FF2 
    JK_FF ff2 (
        .clk(q1_out),
        .j(jk_mode),
        .k(jk_mode),
        .q(q2_out)
    );

    // FF3
    JK_FF ff3 (
        .clk(q2_out),
        .j(jk_mode),
        .k(jk_mode),
        .q(q3_out)
    );

    // FF4 
    JK_FF ff4 (
        .clk(q3_out),
        .j(jk_mode),
        .k(jk_mode),
        .q(q4_out)
    );

    // FF5
    JK_FF ff5 (
        .clk(q4_out),
        .j(jk_mode),
        .k(jk_mode),
        .q(q5_out)
    );
    assign Q[0] = q0_out;
    assign Q[1] = q1_out;
    assign Q[2] = q2_out;
    assign Q[3] = q3_out;
    assign Q[4] = q4_out;
    assign Q[5] = q5_out;

endmodule

module tb_contador_crescente_6bits;
    reg tb_clk;
    wire [5:0] tb_Q;
    contador_crescente_6bits uut (
        .clk_principal(tb_clk),
        .Q(tb_Q)
    );
    initial begin
        tb_clk = 1'b0;
        forever #5 tb_clk = ~tb_clk;
    end
    initial begin
        #1;
        $display("Tempo\tCLK\tQ[5:0] (Decimal)");
        $monitor("%4dns\t%b\t%06b (%2d)", $time, tb_clk, tb_Q, tb_Q);
        #650 $finish;
    end

endmodule