// Matheus de Almeida Moreira
// 848813
`timescale 1ns / 1ps

module shift_reg_5bits (
    input wire clk,
    input wire rst,
    input wire LD,
    input wire load_bit,
    output reg [4:0] Q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 5'b0;
    end else begin
        if (LD) begin
            Q <= {Q[3:0], load_bit};
        end else begin
            Q <= {Q[3:0], 1'b0};
        end
    end
end

endmodule

module testbench;

    reg clk;
    reg rst;
    reg LD;
    reg load_bit;
    wire [4:0] Q;

    // Instancia o módulo
    shift_reg_5bits uut (
        .clk(clk),
        .rst(rst),
        .LD(LD),
        .load_bit(load_bit),
        .Q(Q)
    );

    // Clock: período 10 ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // clock toggling a cada 5ns
    end
    initial begin
        $dumpfile("1401.vcd");
        $dumpvars(0, testbench);
    end
    initial begin
        // Inicialização
        rst = 1;
        LD = 0;
        load_bit = 0;
        #15;             // aguarda 15 ns

        rst = 0;         // tira reset
        #10;

        // Deslocamento simples para a esquerda (LD=0)
        LD = 0;
        #50;             // aguarda 50 ns (5 ciclos de clock)

        // Agora, ativa load com load_bit=1 para presetar bit 0
        LD = 1;
        load_bit = 1;
        #50;

        // Continua deslocando com LD=0 para ver deslocamento normal
        LD = 0;
        #50;

        // Teste com load_bit=0
        LD = 1;
        load_bit = 0;
        #50;

        // Finaliza simulação
        $stop;
    end

endmodule
