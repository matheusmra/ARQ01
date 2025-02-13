/*

 Matheus de Almeida Moreira - 848813
 
*/
module Guia_0203;
    // define data
    reg [7:0] a  = 8'b01101000 ; 
    reg [7:0] b  = 8'b10001100 ; 
    reg [7:0] c  = 8'b10010100 ; 
    reg [7:0] d  = 8'b11100100 ; 
    reg [7:0] d1 = 8'b00000001 ; 
    reg [7:0] e  = 8'b11010000 ; 
    reg [7:0] e1 = 8'b00001011 ; 

    // actions
    initial begin : main
        $display("Exercicio 03");
        $display("a.) 0,011010(2) =   0.%o%o%o(4)  ", a[7:6], a[5:4], a[3:2]);
        $display("b.) 0,100011(2) =   0.%o%o(8)    ", b[7:5], b[4:2]);
        $display("c.) 0,100101(2) =   0.%x%x(16)  ", c[7:4], c[3:0]);
        $display("d.) 1,111001(2) = %o.%o%o(8)    ", d1[7:0], d[7:5], d[4:2]);
        $display("e.) 1011,1101(2) =  %x.%x(16)   ", e1[7:0], e[7:4]);
    end // main
endmodule // Guia_0203