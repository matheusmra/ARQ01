// Matheus de Almeida Moreira
// 848813
`timescale 1ns / 1ps

module ring_shift_reg_right_5bit (
    input wire clk,
    input wire rst,
    output reg [4:0] Q
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q <= 5'b00000;
    end else begin
        Q <= {Q[3:0], 1'b1};  // desloca para a direita com carga unitária no primeiro bit
    end
end

endmodule

module testbench;

    reg clk;
    reg rst;
    wire [4:0] Q;

    ring_shift_reg_right_5bit uut (
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    // Clock 10ns de período
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("1403.vcd");
        $dumpvars(0, testbench);
    end
    initial begin
        rst = 1;
        #15;
        rst = 0;
        
        // roda por 10 ciclos de clock
        #100;
        
        $stop;
    end

endmodule
