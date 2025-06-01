// Matheus de Almeida Moreira
// 848813
`timescale 1ns / 1ps

module twisted_ring_shift_reg_left_5bit (
    input wire clk,
    input wire rst,
    output reg [4:0] Q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 5'b10000;   // carga unitária inicial no primeiro estágio
    end else begin
        Q <= {Q[3:0], ~Q[4]};  // desloca para a esquerda com entrada = complemento do último bit
    end
end

endmodule


module testbench;

    reg clk;
    reg rst;
    wire [4:0] Q;

    twisted_ring_shift_reg_left_5bit uut (
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    // Clock com período 10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("1404.vcd");
        $dumpvars(0, testbench);
    end
    
    initial begin
        rst = 1;
        #15;
        rst = 0;

        // Deixa rodar por 100ns (10 ciclos)
        #100;

        $stop;
    end

endmodule
