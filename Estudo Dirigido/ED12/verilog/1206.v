// Matheus de Almeida Moreira
// 848813
module ram_4x16 (
    input wire clk,
    input wire enable,
    input wire write_enable,
    input wire [1:0] addr,         // 2 bits: 00 a 11
    input wire [15:0] dados_in,
    output reg [15:0] dados_out
);
    wire [7:0] out_low, out_high;

    ram_4x8 ram_low (
        .clk(clk),
        .enable(enable),
        .write_enable(write_enable),
        .addr(addr),
        .dados_in(dados_in[7:0]),
        .dados_out(out_low)
    );

    ram_4x8 ram_high (
        .clk(clk),
        .enable(enable),
        .write_enable(write_enable),
        .addr(addr),
        .dados_in(dados_in[15:8]),
        .dados_out(out_high)
    );

    always @(*) begin
        if (enable && !write_enable)
            dados_out = {out_high, out_low};
        else
            dados_out = 16'bzzzz_zzzz_zzzz_zzzz;
    end
endmodule
