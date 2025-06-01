// Matheus de Almeida Moreira
// 848813
`timescale 1ns / 1ps

module shift_reg_5bits_load_all (
    input wire clk,
    input wire rst,
    input wire LD,
    input wire [4:0] preset_value,
    output reg [4:0] Q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 5'b0;
    end else if (LD) begin
        Q <= preset_value;         // Carrega o valor inteiro no registrador
    end else begin
        Q <= {Q[3:0], 1'b0};      // Desloca para a esquerda, entra 0 no LSB
    end
end

endmodule


module testbench;

    reg clk;
    reg rst;
    reg LD;
    reg [4:0] preset_value;
    wire [4:0] Q;

    shift_reg_5bits_load_all uut (
        .clk(clk),
        .rst(rst),
        .LD(LD),
        .preset_value(preset_value),
        .Q(Q)
    );

    // Clock com período de 10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("1402.vcd");
        $dumpvars(0, testbench);
    end
    initial begin
        rst = 1; LD = 0; preset_value = 5'b00000;
        #15;
        rst = 0;

        // Carrega um valor inicial
        LD = 1;
        preset_value = 5'b10101; // Exemplo: carregar 10101
        #20;

        // Desliga load, começa a deslocar
        LD = 0;
        #50;

        // Novo valor de load
        LD = 1;
        preset_value = 5'b11111; // carregar tudo 1
        #20;

        LD = 0;
        #50;

        $stop;
    end

endmodule
