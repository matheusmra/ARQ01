`timescale 1ns/1ps
module jk_ff_with_preset_clear (
    output reg q,
    output     q_bar, 
    input j, k, clk,
    input pre_n, 
    input clr_n  
);
    assign q_bar = ~q;

    initial begin
        q = 1'b0; 
    end

    always @(negedge clk or negedge pre_n or negedge clr_n) begin
        if (!pre_n && !clr_n) begin
            q <= 1'b1; 
        end else if (!pre_n) begin // Preset ativo
            q <= 1'b1;
        end else if (!clr_n) begin // Clear ativo
            q <= 1'b0;
        end else begin      // Operação normal do JK na borda de descida do clock
            case ({j, k})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;
                default: q <= q;
            endcase
        end
    end
endmodule


module contador_decrescente_5bit (
    input main_clock,
    output [4:0] Q_output
);
    wire q0_s, q1_s, q2_s, q3_s, q4_s;
    wire q0_bar_s, q1_bar_s, q2_bar_s, q3_bar_s; 
    wire jk_toggle_mode = 1'b1;
    wire preset_clear_inactive = 1'b1; 

    wire is_zero;
    assign is_zero = ~(q4_s | q3_s | q2_s | q1_s | q0_s);

    wire pre_q0_n, clr_q1_n, clr_q2_n, pre_q3_n, clr_q4_n;

    assign pre_q0_n = ~is_zero; 
    assign clr_q1_n = ~is_zero; 
    assign clr_q2_n = ~is_zero; 
    assign pre_q3_n = ~is_zero; 
    assign clr_q4_n = ~is_zero; 


    // FF0 
    jk_ff_with_preset_clear ff0 (
        .q(q0_s), .q_bar(q0_bar_s),
        .j(jk_toggle_mode), .k(jk_toggle_mode),
        .clk(main_clock),
        .pre_n(pre_q0_n), .clr_n(preset_clear_inactive) 
    );

    // FF1 (Q1)
    jk_ff_with_preset_clear ff1 (
        .q(q1_s), .q_bar(q1_bar_s),
        .j(jk_toggle_mode), .k(jk_toggle_mode),
        .clk(q0_bar_s), 
        .pre_n(preset_clear_inactive), .clr_n(clr_q1_n) 
    );

    // FF2 (Q2)
    jk_ff_with_preset_clear ff2 (
        .q(q2_s), .q_bar(q2_bar_s),
        .j(jk_toggle_mode), .k(jk_toggle_mode),
        .clk(q1_bar_s), 
        .pre_n(preset_clear_inactive), .clr_n(clr_q2_n) 
    );

    // FF3 (Q3)
    jk_ff_with_preset_clear ff3 (
        .q(q3_s), .q_bar(q3_bar_s),
        .j(jk_toggle_mode), .k(jk_toggle_mode),
        .clk(q2_bar_s), 
        .pre_n(pre_q3_n), .clr_n(preset_clear_inactive) 
    );

    // FF4 (MSB - Q4)
    jk_ff_with_preset_clear ff4 (
        .q(q4_s), 
        .j(jk_toggle_mode), .k(jk_toggle_mode),
        .clk(q3_bar_s), 
        .pre_n(preset_clear_inactive), .clr_n(clr_q4_n) 
    );

    assign Q_output[0] = q0_s;
    assign Q_output[1] = q1_s;
    assign Q_output[2] = q2_s;
    assign Q_output[3] = q3_s;
    assign Q_output[4] = q4_s;

endmodule

module tb_contador_decrescente_5bit;

    reg clk_tb;
    wire [4:0] Q_tb;

    contador_decrescente_5bit uut (
        .main_clock(clk_tb),
        .Q_output(Q_tb)
    );

    initial begin
        clk_tb = 1'b0;
    end
    always #5 clk_tb = ~clk_tb; 

    initial begin
        $display("Time\tCLK\tQ[4:0]\tDecimal");
        $monitor("%4dns\t%b\t%5b\t%2d", $time, clk_tb, Q_tb, Q_tb);
        #250 $finish; 
    end

endmodule