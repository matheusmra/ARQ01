// Matheus de Almeida Moreira
// 848813
module ram_8x8 (
    input wire clk,
    input wire enable,
    input wire write_enable,
    input wire [2:0] addr,         // 3 bits: 000 a 111
    input wire [7:0] dados_in,
    output reg [7:0] dados_out
);
    wire [7:0] out0, out1;
    wire en0 = enable && (addr[2] == 0);
    wire en1 = enable && (addr[2] == 1);

    // RAM 0: endereços 000 a 011
    ram_4x8 ram0 (
        .clk(clk),
        .enable(en0),
        .write_enable(write_enable),
        .addr(addr[1:0]),
        .dados_in(dados_in),
        .dados_out(out0)
    );

    // RAM 1: endereços 100 a 111
    ram_4x8 ram1 (
        .clk(clk),
        .enable(en1),
        .write_enable(write_enable),
        .addr(addr[1:0]),
        .dados_in(dados_in),
        .dados_out(out1)
    );

    always @(*) begin
        if (enable && !write_enable)
            dados_out = addr[2] ? out1 : out0;
        else
            dados_out = 8'bzzzz_zzzz;
    end
endmodule
