/*

 Matheus de Almeida Moreira - 848813
 
*/
module Guia_0201;
    // define data
    real x1 = 0 ; // decimal
    real x2 = 0 ; // decimal
    real x3 = 0 ; // decimal
    real x4 = 0 ; // decimal
    real x5 = 0 ; // decimal
    real power2 = 1.0; // power of 2
    integer y = 4 ; // counter (fraction part length - 1)
    reg [7:0] a  = 8'b00101000; 
    reg [7:0] b  = 8'b01101000; 
    reg [7:0] c  = 8'b10001000; 
    reg [7:0] d  = 8'b10111000; 
    reg [7:0] d1 = 8'b00000001; 
    reg [7:0] e  = 8'b11101000; 
    reg [7:0] e1 = 8'b00000011; 

    // actions
    initial
        begin : main
            $display ( "\nValores Binarios:\n" );
            $display ( "A = 0.%5b(2)", a[7:3] );
            $display ( "B = 0.%5b(2)", b[7:3] );
            $display ( "C = 0.%5b(2)", c[7:3] );
            $display ( "D = %1b.%5b(2)", d1[0], d[7:3] );
            $display ( "E = %2b.%5b(2)\n", e1[1:0], e[7:3] );

            $display ( "Valores em Decimal:\n" );
            

            while ( y >= 0 )
            begin
                power2 = power2 / 2.0;
                if ( a[y+3] == 1 ) 
                begin
                    x1 = x1 + power2;
                end
                if ( b[y+3] == 1 )
                begin
                    x2 = x2 + power2;
                end
                if ( c[y+3] == 1 )
                begin
                    x3 = x3 + power2;
                end
                if ( d[y+3] == 1 )
                begin
                    x4 = x4 + power2;
                end
                if ( e[y+3] == 1 )
                begin
                    x5 = x5 + power2;
                end
                y=y-1;
            end // end while

            x4 = x4 + d1[0]; 
            x5 = x5 + d1[1:0]; 

            $display ( "A = %f(10)", x1 ); // a.)
            $display ( "B = %f(10)", x2 ); // b.)
            $display ( "C = %f(10)", x3 ); // c.)
            $display ( "D = %f(10)", x4 ); // d.)
            $display ( "E = %f(10)", x5 ); // e.)
        end // main
endmodule // Guia_0201
