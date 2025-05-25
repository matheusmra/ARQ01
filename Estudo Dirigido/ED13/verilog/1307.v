`timescale 1ns / 1ps

module flip_flop_jk (
    output q,
    output q_neg,
    input j,
    input k,
    input clk,
    input limpar_n
);
    reg q_reg;

    assign q = q_reg;
    assign q_neg = ~q_reg;

    initial begin
        q_reg = 1'b0;
    end

    always @(posedge clk or negedge limpar_n) begin
        if (!limpar_n) begin
            q_reg <= 1'b0;
        end else begin
            case ({j, k})
                2'b00: q_reg <= q_reg;
                2'b01: q_reg <= 1'b0;
                2'b10: q_reg <= 1'b1;
                2'b11: q_reg <= ~q_reg;
                default: q_reg <= 1'bx;
            endcase
        end
    end
endmodule

module anel_6bits (
    output [5:0] saida_q,
    input clk,
    input reset_n
);

    wire q0, q1, q2, q3, q4, q5;
    wire q0_neg, q1_neg, q2_neg, q3_neg, q4_neg, q5_neg;

    flip_flop_jk ff0 (
        .q(q0),
        .q_neg(q0_neg),
        .j(q5_neg),
        .k(q5),
        .clk(clk),
        .limpar_n(reset_n)
    );

    flip_flop_jk ff1 (
        .q(q1),
        .q_neg(q1_neg),
        .j(q0),
        .k(q0_neg),
        .clk(clk),
        .limpar_n(reset_n)
    );

    flip_flop_jk ff2 (
        .q(q2),
        .q_neg(q2_neg),
        .j(q1),
        .k(q1_neg),
        .clk(clk),
        .limpar_n(reset_n)
    );

    flip_flop_jk ff3 (
        .q(q3),
        .q_neg(q3_neg),
        .j(q2),
        .k(q2_neg),
        .clk(clk),
        .limpar_n(reset_n)
    );

    flip_flop_jk ff4 (
        .q(q4),
        .q_neg(q4_neg),
        .j(q3),
        .k(q3_neg),
        .clk(clk),
        .limpar_n(reset_n)
    );

    flip_flop_jk ff5 (
        .q(q5),
        .q_neg(q5_neg),
        .j(q4),
        .k(q4_neg),
        .clk(clk),
        .limpar_n(reset_n)
    );

    assign saida_q = {q5, q4, q3, q2, q1, q0};

endmodule

module tesetbench;

    reg clk_tb;
    reg reset_n_tb;
    wire [5:0] saida_q_tb;

    anel_6bits uut (
        .saida_q(saida_q_tb),
        .clk(clk_tb),
        .reset_n(reset_n_tb)
    );

    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

    initial begin
        reset_n_tb = 1'b0;
        #20;
        reset_n_tb = 1'b1;
        #200;
        $finish;
    end

    initial begin
        $dumpfile("anel_6bits.vcd");
        $dumpvars(0, tesetbench);
        $monitor("Tempo = %0t ns\t CLK = %b\t RESET_N = %b\t SAIDA_Q = %6b",
                 $time, clk_tb, reset_n_tb, saida_q_tb);
    end

endmodule