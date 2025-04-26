// Matheus de Almeida Moreira
// 848813
// Guia_0907.v Gerador de pulso com marcação de 5 unidades, sincronizado no nível alto do clock

`include "clock.v"

module pulse ( output reg signal, input clock );

initial begin
    signal = 1'b0;
end

always @(clock) begin
    if (clock == 1'b1) begin
        signal = 1'b1;
        #5 signal = 1'b0; // Condição para desligar: 5 unidades de tempo
    end
end

endmodule

module Guia_0907;
wire clk;
wire pulse_out;

clock CLK1 ( clk );
pulse PULSE1 ( pulse_out, clk );

initial begin
    $dumpfile("Guia_0907.vcd");
    $dumpvars(1, clk, pulse_out);
    #240 $finish;
end

endmodule // Guia_0907
