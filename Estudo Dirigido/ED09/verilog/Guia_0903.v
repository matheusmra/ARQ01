// Matheus de Almeida Moreira
// 848813
// Guia_0903.v- Gerador de pulso com frequência 1/3 do clock


`include "clock.v"

module pulse ( output reg signal, input clock );
reg [1:0] count; 

initial begin
    signal = 1'b0;
    count = 0;
end

always @(posedge clock) begin
    if (count == 2) begin
        signal = ~signal; // Inverte o sinal a cada 3 clocks
        count = 0;
    end
    else begin
        count = count + 1;
    end
end
endmodule

module Guia_0903;
wire clk;
wire pulse_out;

clock CLK1 ( clk );
pulse PULSE1 ( pulse_out, clk );

initial begin
    $dumpfile("Guia_0903.vcd");
    $dumpvars(1, clk, pulse_out);
    #400 $finish;
end

endmodule
