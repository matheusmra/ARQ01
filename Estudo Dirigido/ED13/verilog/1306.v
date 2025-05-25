// Matheus de Almeida Moreira
`timescale 1ns / 1ps

module jk_ff (
    output q,
    output q_bar,
    input j,
    input k,
    input clk,
    input prn,
    input clrn
);
    reg q_reg;

    assign q = q_reg;
    assign q_bar = ~q_reg;

    initial begin
        q_reg = 1'b0;
    end

    always @(posedge clk or negedge prn or negedge clrn) begin
        if (!prn) begin
            q_reg <= 1'b1;
        end else if (!clrn) begin
            q_reg <= 1'b0;
        end else begin
            if (j == 1'b0 && k == 1'b0) begin
                // q_reg <= q_reg;
            end else if (j == 1'b0 && k == 1'b1) begin
                q_reg <= 1'b0;
            end else if (j == 1'b1 && k == 1'b0) begin
                q_reg <= 1'b1;
            end else if (j == 1'b1 && k == 1'b1) begin
                q_reg <= ~q_reg;
            end
        end
    end
endmodule

module anel_6bits (
    output [5:0] q_out,
    input clk,
    input preset_n,
    input clear_n
);

    wire q0, q1, q2, q3, q4, q5;
    wire q0_bar, q1_bar, q2_bar, q3_bar, q4_bar, q5_bar;

    jk_ff ff0 (
        .q(q0),
        .q_bar(q0_bar),
        .j(q5),
        .k(q5_bar),
        .clk(clk),
        .prn(preset_n),
        .clrn(1'b1)
    );

    jk_ff ff1 (
        .q(q1),
        .q_bar(q1_bar),
        .j(q0),
        .k(q0_bar),
        .clk(clk),
        .prn(1'b1),
        .clrn(clear_n)
    );

    jk_ff ff2 (
        .q(q2),
        .q_bar(q2_bar),
        .j(q1),
        .k(q1_bar),
        .clk(clk),
        .prn(1'b1),
        .clrn(clear_n)
    );

    jk_ff ff3 (
        .q(q3),
        .q_bar(q3_bar),
        .j(q2),
        .k(q2_bar),
        .clk(clk),
        .prn(1'b1),
        .clrn(clear_n)
    );

    jk_ff ff4 (
        .q(q4),
        .q_bar(q4_bar),
        .j(q3),
        .k(q3_bar),
        .clk(clk),
        .prn(1'b1),
        .clrn(clear_n)
    );

    jk_ff ff5 (
        .q(q5),
        .q_bar(q5_bar),
        .j(q4),
        .k(q4_bar),
        .clk(clk),
        .prn(1'b1),
        .clrn(clear_n)
    );

    assign q_out = {q5, q4, q3, q2, q1, q0};

endmodule

module testbench;

    reg clk_tb;
    reg preset_n_tb;
    reg clear_n_tb;
    wire [5:0] q_out_tb;

    anel_6bits dut (
        .q_out(q_out_tb),
        .clk(clk_tb),
        .preset_n(preset_n_tb),
        .clear_n(clear_n_tb)
    );

    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

    initial begin
        preset_n_tb = 1'b0;
        clear_n_tb = 1'b0;
        #10;

        preset_n_tb = 1'b0;
        clear_n_tb = 1'b1;
        #10;
        
        preset_n_tb = 1'b0;
        clear_n_tb = 1'b0;
        #5;
        
        preset_n_tb = 1'b1;
        clear_n_tb = 1'b1;
        #200;

        $finish;
    end

    initial begin
        $dumpfile("anel_6bits.vcd");
        $dumpvars(0, testbench);
        $monitor("Time = %0t ns\t CLK = %b\t PRESET_N = %b\t CLEAR_N = %b\t Q_OUT = %6b",
                 $time, clk_tb, preset_n_tb, clear_n_tb, q_out_tb);
    end

endmodule