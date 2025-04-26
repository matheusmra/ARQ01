// Matheus de ALmeida Moreira
// 848813
// Guia_0906.v - Gerador de pulso com marcação de 4 unidades, sincronizado na borda de descida


`include "clock.v"

module pulse ( output reg signal, input clock );

initial begin
    signal = 1'b0;
end

always @(negedge clock) begin
    signal = 1'b1;
    #4 signal = 1'b0; // Condição para desligar: 4 unidades de tempo
end

endmodule

module Guia_0906;
wire clk;
wire pulse_out;

clock CLK1 ( clk );
pulse PULSE1 ( pulse_out, clk );

initial begin
    $dumpfile("Guia_0906.vcd");
    $dumpvars(1, clk, pulse_out);
    #240 $finish;
end

endmodule 
