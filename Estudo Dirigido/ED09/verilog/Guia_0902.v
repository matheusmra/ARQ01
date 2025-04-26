
// Matheus de Almeida Moreira
// 848813
// Guia_0902.v - Geradores de pulso com períodos diferentes

`include "clock.v"

module pulse1 ( output reg signal, input clock );
always @ (posedge clock)
begin
    signal = 1'b1;
    #3 signal = 1'b0;
end
endmodule

module pulse2 ( output reg signal, input clock );
always @ (posedge clock)
begin
    signal = 1'b1;
    #6 signal = 1'b0;
end
endmodule

module pulse3 ( output reg signal, input clock );
always @ (posedge clock)
begin
    signal = 1'b1;
    #9 signal = 1'b0;
end
endmodule

//testbench
module test_Guia_0902;
wire clk;
wire p1, p2, p3;

clock clkGen ( clk );
pulse1 pulseGen1 ( p1, clk );
pulse2 pulseGen2 ( p2, clk );
pulse3 pulseGen3 ( p3, clk );

initial begin
    $dumpfile("Guia_0902.vcd");
    $dumpvars(1, clk, p1, p2, p3);
    
    #300 $finish; 
end

endmodule
