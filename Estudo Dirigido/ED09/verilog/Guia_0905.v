// Matheus de Almeida Moreira
// 848813
// Guia_0905.v- Gerador de pulso com marcação de 3 unidades, sincronizado no clock


`include "clock.v"

module pulse ( output reg signal, input clock );

initial begin
    signal = 1'b0;
end

always @(posedge clock) begin
    signal = 1'b1;
    #3 signal = 1'b0; // Condição para desligar: 3 unidades de tempo
end

endmodule


module Guia_0905;
wire clk;
wire pulse_out;

clock CLK1 ( clk );
pulse PULSE1 ( pulse_out, clk );

initial begin
    $dumpfile("Guia_0905.vcd");
    $dumpvars(1, clk, pulse_out);
    #200 $finish;
end

endmodule 
