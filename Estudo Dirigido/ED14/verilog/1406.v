// Matheus de Almeida Moreira
// 848813
`timescale 1ns / 1ps

module ring_shift_reg_left_6bit (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [5:0] preset_value,
    output reg [5:0] Q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 6'b0;
    end else if (load) begin
        Q <= preset_value;  // carga inicial
    end else begin
        Q <= {Q[4:0], Q[5]}; // deslocamento circular para a esquerda
    end
end

endmodule


module testbench;

    reg clk;
    reg rst;
    reg load;
    reg [5:0] preset_value;
    wire [5:0] Q;

    ring_shift_reg_left_6bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .preset_value(preset_value),
        .Q(Q)
    );

    // Clock 10ns período
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("1406.vcd");
        $dumpvars(0, testbench);
    end
    initial begin
        rst = 1; load = 0; preset_value = 6'b0;
        #15;
        rst = 0;

        // Carga inicial do registrador
        load = 1;
        preset_value = 6'b101010; 
        #10;

        load = 0; // deslocamento circular começa
        #100;    // roda por 10 ciclos

        $stop;
    end

endmodule
