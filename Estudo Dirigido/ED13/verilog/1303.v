// Matheus de Almeida Moreira
// 848813
`timescale 1ns/1ps
module jk_ff_with_clear (
    output reg q,
    input j,
    input k,
    input clk,
    input clr_n // Clear assíncrono ativo baixo
);
    initial begin
        q = 1'b0; 
    end

    always @(negedge clk or negedge clr_n) begin
        if (!clr_n) begin // Se clr_n está ativo (0)
            q <= 1'b0;    // Reseta q para 0
        end else begin      // Operação normal do JK na borda de descida do clock
            case ({j, k})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;
                default: q <= q; // Para completude em simulação
            endcase
        end
    end
endmodule

module contador_crescente_5bits (
    input main_clock,         // Clock externo principal
    output [4:0] Q_output    // Saída do contador (Q4 Q3 Q2 Q1 Q0)
);
    // Sinais internos para as saídas Q de cada flip-flop
    wire q0_s, q1_s, q2_s, q3_s, q4_s;

    // J e K sempre em '1' para modo toggle
    wire jk_toggle_mode = 1'b1;
    wire clear_inactive = 1'b1; 
    wire reset_condition_n;
    nand NAND_reset_gate (reset_condition_n, q3_s, q1_s);

    // FF0 
    jk_ff_with_clear ff0 (
        .q(q0_s),
        .j(jk_toggle_mode),
        .k(jk_toggle_mode),
        .clk(main_clock),
        .clr_n(clear_inactive) 
    );

    // FF1
    jk_ff_with_clear ff1 (
        .q(q1_s),
        .j(jk_toggle_mode),
        .k(jk_toggle_mode),
        .clk(q0_s), 
        .clr_n(reset_condition_n)
    );

    // FF2
    jk_ff_with_clear ff2 (
        .q(q2_s),
        .j(jk_toggle_mode),
        .k(jk_toggle_mode),
        .clk(q1_s), 
        .clr_n(clear_inactive) 
    );

    // FF3 
    jk_ff_with_clear ff3 (
        .q(q3_s),
        .j(jk_toggle_mode),
        .k(jk_toggle_mode),
        .clk(q2_s), 
        .clr_n(reset_condition_n) 
    );

    // FF4
    jk_ff_with_clear ff4 (
        .q(q4_s),
        .j(jk_toggle_mode),
        .k(jk_toggle_mode),
        .clk(q3_s), 
        .clr_n(reset_condition_n) 
    );
    assign Q_output[0] = q0_s; 
    assign Q_output[1] = q1_s;
    assign Q_output[2] = q2_s;
    assign Q_output[3] = q3_s;
    assign Q_output[4] = q4_s; 
endmodule


module tb_contador_crescente_6bits;
    reg clk_tb;
    wire [4:0] Q_tb;
    contador_crescente_5bits uut (
        .main_clock(clk_tb),
        .Q_output(Q_tb)
    );
    initial begin
        clk_tb = 1'b0; 
        forever #5 clk_tb = ~clk_tb; 
    end
    initial begin
        $display("Time\tCLK\tQ[4:0]\tDecimal");
        $monitor("%4dns\t%b\t%5b\t%2d", $time, clk_tb, Q_tb, Q_tb);
        #200 $finish; 
    end

endmodule