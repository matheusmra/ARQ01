/* 
Guia_0104.v
848813 - Matheus de Almeida Moreira
*/
module Guia_0104;
reg [7:0] b;  
initial
begin : main
    $display("Guia_0104 - Conversões por agrupamento");
    b = 8'b00010110;
    $display("10110 (2) = [%2b] [%2b] [%2b] (4) = %o (4)", b[5:4], b[3:2], b[1:0], {b[5:4], b[3:2], b[1:0]});
    b = 8'b00011011; 
    $display("11011 (2) = [%3b] [%3b] (8) = %o (8)", b[5:3], b[2:0], {b[5:3], b[2:0]});
    b = 8'b00100100; 
    $display("100100 (2) = [%4b] [%4b] (16) = %x (16)", b[7:4], b[3:0], {b[7:4], b[3:0]});
    b = 8'b00101011; 
    $display("101011 (2) = [%3b] [%3b] (8) = %o (8)", b[5:3], b[2:0], {b[5:3], b[2:0]});
    b = 8'b00101100; 
    $display("101100 (2) = [%2b] [%2b] [%2b] (4) = %o (4)", b[5:4], b[3:2], b[1:0], {b[5:4], b[3:2], b[1:0]});
end // main
endmodule // Guia_0104
