// Matheus de ALmeida Moreira
// 848813
// Guia_0904.v- Gerador de pulso com frequência 4x do clock

// incluir o clock
`include "clock.v"

module pulse ( output reg signal, input clock );
initial begin
    signal = 1'b0;
end

always begin
    #3 signal = ~signal; // Troca o valor a cada 3 unidades de tempo
end
endmodule

module Guia_0904;
wire clk;
wire pulse_out;

clock CLK1 ( clk );
pulse PULSE1 ( pulse_out, clk );

initial begin
    $dumpfile("Guia_0904.vcd");
    $dumpvars(1, clk, pulse_out);
    #120 $finish;
end

endmodule // Guia_0904
