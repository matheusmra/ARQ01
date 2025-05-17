// Matheus de Almeida Moreira
// 848813

// RAM 1x8: usa duas RAMs 1x4 (MSB e LSB)
module ram_1x8 (
    input wire CLK_,
    input wire R_W_,
    input wire ADDR_,
    input wire [7:0] data_in,
    output wire [7:0] data_out,
    input wire CLR
);

    // Saídas intermediárias das duas RAMs 1x4
    wire [3:0] data_out_low;
    wire [3:0] data_out_high;

    // Instância da RAM 1x4 (4 bits menos significativos)
    ram_1x4 ram_lsb (
        .CLK_(CLK_),
        .R_W_(R_W_),
        .ADDR_(ADDR_),
        .data_in(data_in[3:0]),
        .data_out(data_out_low),
        .CLR(CLR)
    );

    // Instância da RAM 1x4 (4 bits mais significativos)
    ram_1x4 ram_msb (
        .CLK_(CLK_),
        .R_W_(R_W_),
        .ADDR_(ADDR_),
        .data_in(data_in[7:4]),
        .data_out(data_out_high),
        .CLR(CLR)
    );

    // Junta os dois blocos de 4 bits para formar os 8 bits finais
    assign data_out = {data_out_high, data_out_low};

endmodule
