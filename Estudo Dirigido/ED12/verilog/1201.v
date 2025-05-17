// Matheus de Almeida Moreira
// 848813

module ram_1x4 (
    input wire CLK_,             // Clock
    input wire R_W_,             // 1 = escrita, 0 = leitura
    input wire ADDR_,            // Endereço (único, serve como enable)
    input wire [3:0] data_in,    // Entrada de dados
    output reg [3:0] data_out,   // Saída de dados
    input wire CLR               // Reset assíncrono
);

    // Sinais de controle de leitura e escrita
    wire wr_en = R_W_ & ADDR_;     // Escrita habilitada
    wire rd_en = ~R_W_ & ADDR_;    // Leitura habilitada

    wire [3:0] Q;                  // Saída dos FFs JK
    wire [3:0] J, K;

    // Geração dos sinais J e K baseados no dado de entrada e no estado atual
    assign J = wr_en ? (data_in & ~Q) : 4'b0000;
    assign K = wr_en ? (~data_in & Q) : 4'b0000;

    // Instanciando os 4 flip-flops JK
    jk_ff ff0 (J[0], K[0], CLK_, CLR, Q[0]);
    jk_ff ff1 (J[1], K[1], CLK_, CLR, Q[1]);
    jk_ff ff2 (J[2], K[2], CLK_, CLR, Q[2]);
    jk_ff ff3 (J[3], K[3], CLK_, CLR, Q[3]);

    // Leitura na borda de descida do clock
    always @(negedge CLK_) begin
        if (rd_en)
            data_out <= Q;
        else
            data_out <= 4'b0000; // Saída padrão se ADDR_ = 0
    end

endmodule

// Flip-flop JK com reset assíncrono
module jk_ff (
    input wire J, K, CLK, CLR,
    output reg Q
);
    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q <= 0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;        // Sem alteração
                2'b01: Q <= 0;        // Reset
                2'b10: Q <= 1;        // Set
                2'b11: Q <= ~Q;       // Toggle
            endcase
        end
    end
endmodule
