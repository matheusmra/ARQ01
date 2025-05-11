
module Guia_1105 (y, x, clk, reset);
  output reg y;
  input x;
  input clk;
  input reset;
  
  parameter start = 3'b000,
            s0 = 3'b001,
            s01 = 3'b010,
            s010 = 3'b011,
            s1 = 3'b100,
            s10 = 3'b101,
            s101 = 3'b110;

  reg [2:0] E1;
  reg [2:0] E2;
  always @(x or E1) begin
    case (E1)
      start:
        E2 = (x) ? s1 : s0;
      s0:
        E2 = (x) ? s01 : s0;
      s01:
        E2 = (!x) ? s010 : s1;
      s010:
        E2 = start;
      s1:
        E2 = (!x) ? s10 : s1;
      s10:
        E2 = (x) ? s101 : s0;
      s101:
        E2 = start;
      default:
        E2 = start;
    endcase
  end
  always @(posedge clk or negedge reset) begin
    if (!reset)
      E1 <= start;
    else
      E1 <= E2;
  end
  always @(E1) begin
    y = (E1 == s010 || E1 == s101) ? 1 : 0;
  end
endmodule
module main;
  reg clk, reset, x;
  wire y;
  Guia_1105 dut (y, x, clk, reset);
  always #5 clk = ~clk; 
  initial begin
    $display("Iniciando simulação...");
    $dumpfile("Guia_1105.vcd");
    $dumpvars(0, main);
    clk = 0;
    reset = 0;
    x = 0;
    #10 reset = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #20 $finish;
  end
endmodule
