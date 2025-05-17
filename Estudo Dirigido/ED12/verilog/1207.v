// Matheus de Almeida Moreira
// 848813
module ram_1x16 (
    input wire clk,
    input wire enable,
    input wire write_enable,
    input wire [15:0] dados_in,
    output reg [15:0] dados_out
);
    reg [15:0] mem;

    always @(posedge clk) begin
        if (enable && write_enable)
            mem <= dados_in;
    end

    always @(*) begin
        if (enable && !write_enable)
            dados_out = mem;
        else
            dados_out = 16'bzzzz_zzzz_zzzz_zzzz;
    end
endmodule

module ram_8x16 (
    input wire clk,
    input wire enable,
    input wire write_enable,
    input wire [2:0] addr,         // 3 bits: 000 a 111
    input wire [15:0] dados_in,
    output reg [15:0] dados_out
);
    wire [15:0] outs[7:0];
    wire en[7:0];

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : ram_inst
            assign en[i] = enable && (addr == i);

            ram_1x16 ram (
                .clk(clk),
                .enable(en[i]),
                .write_enable(write_enable),
                .dados_in(dados_in),
                .dados_out(outs[i])
            );
        end
    endgenerate

    always @(*) begin
        if (enable && !write_enable)
            dados_out = outs[addr];
        else
            dados_out = 16'bzzzz_zzzz_zzzz_zzzz;
    end
endmodule
