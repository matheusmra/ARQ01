/*
Guia_0101.v
Matheus de Almeida Moreira - 848813
*/
module Guia_0101;
// define data
integer a = 27;   // decimal
integer b = 51;
integer c = 725;
integer d = 132;
integer e = 360;

reg [9:0] bin_a = 0;  // binary (bits - little endian)
reg [9:0] bin_b = 0;
reg [9:0] bin_c = 0;
reg [9:0] bin_d = 0;
reg [9:0] bin_e = 0;

// actions
initial
begin : main
    $display("Guia_0101 - Tests");
    $display("a = %d", a);
    $display("bin_a = %10b", bin_a);
    bin_a = a;
    $display("bin_a = %10b", bin_a);
    $display("\n"); 
    $display("b = %d", b);
    $display("bin_b = %10b", bin_b);
    bin_b = b;
    $display("bin_b = %10b", bin_b);
    $display("\n"); 
    $display("c = %d", c);
    $display("bin_c = %10b", bin_c);
    bin_c = c;
    $display("bin_c = %10b", bin_c);
    $display("\n"); 
    $display("d = %d", d);
    $display("bin_d = %10b", bin_d);
    bin_d = d;
    $display("bin_d = %10b", bin_d);
    $display("\n"); 
    $display("e = %d", e);
    $display("bin_e = %10b", bin_e);
    bin_e = e;
    $display("bin_e = %10b", bin_e);
end // main
endmodule // Guia_0101