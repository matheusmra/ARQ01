/*
Guia_0102.v
848813 - Matheus de Almeida Moreira
*/
module Guia_0102;
// define data
integer a; // decimal
integer b; // decimal
integer c; // decimal
integer d; // decimal
integer e; // decimal
reg [7:0] bin_a = 8'b00010011;  
reg [7:0] bin_b = 8'b00010101;  
reg [7:0] bin_c = 8'b00010110; 
reg [7:0] bin_d = 8'b00110010;  
reg [7:0] bin_e = 8'b00111011; 

// actions
initial
begin : main
  $display ( "Guia_0102 - Tests" );
  a = bin_a;
  $display ("10011(2) = %d(10)", a);
  b = bin_b;
  $display ("10101(2) = %d(10)", b);
  c = bin_c;
  $display ("10110(2) = %d(10)", c);
    d = bin_d;
  $display ("110010(2) = %d(10)", d);
    e = bin_e;
  $display ("111011(2) = %d(10)", e);
end // main
endmodule // Guia_0102
