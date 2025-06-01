// Matheus de Almeida Moreira
// 848813
`timescale 1ns / 1ps

module parallel_to_serial_5bit (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [4:0] data_in,
    output reg data_out
);

reg [4:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 5'b0;
        data_out <= 0;
    end else if (load) begin
        shift_reg <= data_in;    // carrega o registrador com dados paralelos
        data_out <= data_in[0];  // saída começa com o bit menos significativo
    end else begin
        data_out <= shift_reg[0];          // saída série é o bit menos significativo
        shift_reg <= {1'b0, shift_reg[4:1]}; // desloca para a direita
    end
end

endmodule


module testbench;

    reg clk;
    reg rst;
    reg load;
    reg [4:0] data_in;
    wire data_out;

    parallel_to_serial_5bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock com período 10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("1405.vcd");
        $dumpvars(0, testbench);
    end
    initial begin
        rst = 1; load = 0; data_in = 5'b00000;
        #15;
        rst = 0;

        // Carrega valor paralelo 10110
        load = 1;
        data_in = 5'b10110;
        #10;

        load = 0;  // começa deslocar
        #60;

        $stop;
    end

endmodule
