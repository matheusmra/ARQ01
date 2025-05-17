// Matheus de Almeida Moreira
// 848813
module ram_4x8 (
    input wire clk,
    input wire enable,
    input wire write_enable,
    input wire [1:0] addr,           // 2 bits de endereço
    input wire [7:0] dados_in,
    output reg [7:0] dados_out
);

    wire [7:0] out0, out1;           // Saídas das RAMs 2x8
    wire sel0 = (addr[1] == 1'b0);   // Seleciona RAM 0
    wire sel1 = (addr[1] == 1'b1);   // Seleciona RAM 1

    // Instância da RAM 2x8 - bloco inferior
    ram_2x8 ram0 (
        .clk(clk),
        .enable(enable && sel0),
        .write_enable(write_enable),
        .addr(addr[0]),
        .dados_in(dados_in),
        .dados_out(out0)
    );

    // Instância da RAM 2x8 - bloco superior
    ram_2x8 ram1 (
        .clk(clk),
        .enable(enable && sel1),
        .write_enable(write_enable),
        .addr(addr[0]),
        .dados_in(dados_in),
        .dados_out(out1)
    );

    // Seleção da saída com base em addr[1]
    always @(*) begin
        if (enable && !write_enable) begin
            dados_out = (addr[1]) ? out1 : out0;
        end else begin
            dados_out = 8'bzzzz_zzzz; // Alta impedância fora de leitura
        end
    end

endmodule
