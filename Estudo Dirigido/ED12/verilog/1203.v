// Matheus de Almeida Moreira
// 848813

module ram_2x8 (
    input wire CLK_,
    input wire R_W_,             // 1 = escrita, 0 = leitura
    input wire ADDR_,            // Endereço (0 ou 1)
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    input wire CLR
);

    wire [7:0] out0, out1;       // Saídas das duas RAMs
    wire en0 = ~ADDR_;           // Ativa RAM0 quando ADDR_ = 0
    wire en1 =  ADDR_;           // Ativa RAM1 quando ADDR_ = 1

    // RAM para endereço 0
    ram_1x8 ram0 (
        .CLK_(CLK_),
        .R_W_(R_W_),
        .ADDR_(en0),             // Só ativa se en0 = 1
        .data_in(data_in),
        .data_out(out0),
        .CLR(CLR)
    );

    // RAM para endereço 1
    ram_1x8 ram1 (
        .CLK_(CLK_),
        .R_W_(R_W_),
        .ADDR_(en1),             // Só ativa se en1 = 1
        .data_in(data_in),
        .data_out(out1),
        .CLR(CLR)
    );

    // Seleciona saída da RAM ativa
    always @(*) begin
        if (~R_W_) begin // Leitura
            case (ADDR_)
                1'b0: data_out = out0;
                1'b1: data_out = out1;
            endcase
        end else begin
            data_out = 8'b00000000; // Durante escrita, saída é zerada
        end
    end

endmodule
