`timescale 1ns/1ps

module T_FlipFlop (
    output reg Q,
    input      T,
    input      CLK,
    input      RESET
);

    initial begin
        Q = 1'b0;
    end

    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            Q <= 1'b0;
        end else begin
            if (T) begin
                Q <= ~Q;
            end
        end
    end
endmodule

module contador_sincrono (
    input        CLK,
    input        RESET,
    output [2:0] Q_out
);

    wire q0_s, q1_s, q2_s;
    wire t0_s, t1_s, t2_s;

    assign t0_s = (~q2_s) | (~q1_s) | q0_s;
    assign t1_s = (~q1_s & q0_s) | (~q2_s & q1_s & q0_s) | (q2_s & q1_s & ~q0_s);
    assign t2_s = (q1_s & (~q0_s) & q2_s) | (q1_s & q0_s & (~q2_s));

    T_FlipFlop ff0 (
        .Q(q0_s),
        .T(t0_s),
        .CLK(CLK),
        .RESET(RESET)
    );

    T_FlipFlop ff1 (
        .Q(q1_s),
        .T(t1_s),
        .CLK(CLK),
        .RESET(RESET)
    );

    T_FlipFlop ff2 (
        .Q(q2_s),
        .T(t2_s),
        .CLK(CLK),
        .RESET(RESET)
    );

    assign Q_out = {q2_s, q1_s, q0_s};

endmodule

module tb_contador_sincrono;

    reg clk_tb;
    reg reset_tb;
    wire [2:0] q_out_tb;

    contador_sincrono uut (
        .CLK(clk_tb),
        .RESET(reset_tb),
        .Q_out(q_out_tb)
    );

    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

    initial begin
        reset_tb = 1;
        #10;
        reset_tb = 0;
        #20;
        #150;
        $finish;
    end

    initial begin
        $monitor("Time: %0t ns \t CLK: %b \t RESET: %b \t Q_out: %b (%0d)",
                 $time, clk_tb, reset_tb, q_out_tb, q_out_tb);
    end

endmodule