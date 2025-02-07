/* 
Guia_0103.v 
848813 - Matheus de Almeida Moreira
*/ 
module Guia_0103; 
// define data 
integer   x; // decimal 
reg [7:0] b;  // binary 
reg [9:0] hex;  // binary 

function [15:0] dec24;
    input [31:0] decimal;
    integer base4;
    integer place;
    begin
        base4 = 0;
        place = 1;
        while (decimal > 0) begin
            base4 = base4 + (decimal % 4) * place;
            decimal = decimal / 4;
            place = place * 10;
        end
        dec24 = base4;
    end
endfunction

// actions 
initial 
begin : main 
    x = 54;
    b = x; 
    $display ("54 (10) = %d (4)", dec24(x));
    x = 67;
    b = x; 
    $display ("67 (10) =  %o (8)", b);
    x = 76;
    b = x; 
    $display ("76 (10) = %x (16)", b);
    x = 157;
    b = x; 
    $display ("157 (10) = %x (16)", b);
    x = 731;
    hex = x; 
    $display ("731 (10) = %x (16)", hex);
end // main 
endmodule // Guia_0103