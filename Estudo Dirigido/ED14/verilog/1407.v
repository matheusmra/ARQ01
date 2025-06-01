// Matheus de Almeida Moreira
// 848813
`timescale 1ns / 1ps

module twisted_ring_shift_reg_right_6bit (
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
        Q <= preset_value;  // carga inicial (preset)
    end else begin
        Q <= {~Q[0], Q[5:1]};  // deslocamento para a direita com entrada = complemento do bit 0 (último bit antes do deslocamento)
    end
end

endmodule

module testbench;

    reg clk;
    reg rst;
    reg load;
    reg [5:0] preset_value;
    wire [5:0] Q;

    twisted_ring_shift_reg_right_6bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .preset_value(preset_value),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("1407.vcd");
        $dumpvars(0, testbench);
    end

    initial begin
        rst = 1; load = 0; preset_value = 6'b0;
        #15;
        rst = 0;

        // Carga inicial
        load = 1;
        preset_value = 6'b100000;
        #10;

        load = 0;
        #120;

        $stop;
    end

endmodule
