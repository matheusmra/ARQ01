module Guia_0204;
    // Define data with the correct bit-widths
    reg [7:0]  b1  = 8'b10110100;  // a.) 0.231(4) = 0.10110100(2) -> 8 bits
    reg [12:0] b2  = 13'b0100110000100;  // b.) 0.5C2(16) = 0.13202(4) -> 13 bits
    reg [9:0]  b3  = 10'b1110111010;  // c.) 0.735(8) = 0.1110111010(2) -> 10 bits
    reg [15:0] b4  = 16'b110000010011001; // d.) 6.2345(8) = 30.103211(4) -> 15 bits
    reg [15:0] b5  = 16'b1011101001011110; // e.) B,A5E(16) = 23.221132(4) -> 16 bits
    reg [3:0]  b41 = 4'o30;  // d.) integer part = 30(8)
    reg [3:0]  b51 = 4'hB;  // e.) integer part = 11(16)

    // Actions
    initial
        begin : main
        $display ( "Exercicio 4" );

        // Displaying values in binary and quaternary formats
        $display ( "b1 =  0.%8b (2)            ", b1[7:0]); // a.) 0.10110100(2)
        
        // Displaying quaternary format by grouping binary digits in pairs
        $display ( "b2 =  0.%o%o%o%o%o (4)      ", b2[12:10], b2[9:8], b2[7:6], b2[5:4], b2[3:2]); // b.) 0.13202(4)
        $display ( "b3 =  0.%10b (2)           ", b3[9:0]); // c.) 0.1110111010(2)
        $display ( "b4 =  %o.%o%o%o%o%o (4)        ", b41[3:2], b41[1:0], b4[15:14], b4[13:12], b4[11:10], b4[9:8]); // d.) 30.103211(4)
        
        // Displaying quaternary with more precision for b5
        $display ( "b5 =  %o%o.%o%o%o%o (4)    ", b51[3:2], b51[1:0], b5[15:14], b5[13:12], b5[11:10], b5[9:8], b5[7:6], b5[5:4]); // e.) 23.221132(4)
        
        end // main
endmodule // Guia_0204
