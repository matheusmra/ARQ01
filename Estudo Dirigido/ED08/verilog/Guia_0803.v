
module isEquals ( output s, input a, input b ); 

    xnor XNOR0 ( s, a, b ); 
endmodule // isEquals 


module Guia_0803; 

    reg  [5:0] x; 
    reg  [5:0] y; 

    reg  [5:0] a; 
    reg  [5:0] b; 

    wire [5:0] s1; 
    wire [5:0] s2;
    
    isEquals XY0 ( s1[0], x[0], y[0] );
    isEquals XY1 ( s1[1], x[1], y[1] );
    isEquals XY2 ( s1[2], x[2], y[2] );
    isEquals XY3 ( s1[3], x[3], y[3] );
    isEquals XY4 ( s1[4], x[4], y[4] );
    isEquals XY5 ( s1[5], x[5], y[5] );
    isEquals AB0 ( s2[0], a[0], b[0] );
    isEquals AB1 ( s2[1], a[1], b[1] );
    isEquals AB2 ( s2[2], a[2], b[2] );
    isEquals AB3 ( s2[3], a[3], b[3] );
    isEquals AB4 ( s2[4], a[4], b[4] );
    isEquals AB5 ( s2[5], a[5], b[5] );
    initial begin : start
        x = 6'b101_010;
        y = 6'b101_010;
        a = 6'b100_111;
        b = 6'b100_100;
    end 

    initial begin : main 
        $display("Test ALU’s equality comparator"); 
        #1;
        $write( "%b  ==  %b ? %b = ", x, y, s1 );
		if( s1 == 6'b111111 ) begin
			$display( "true" );
		end // if
		else begin
			$display( "false" );
		end // else

        #1;
        $write( "%b  ==  %b ? %b = ", a, b, s2 );
		if( s2 == 6'b111111 ) begin
			$display( "true" );
		end // if
		else begin
			$display( "false" );
		end // else
    end // main
endmodule // Guia_0803 