module Guia_0701 (
    input wire A, 
    input wire B,
    input wire sel,
    output wire Y1, 
    output wire Y2, 
    output wire Y  
);

    and (Y1, A, B);
    nand (Y2, A, B);

    wire nsel, selY1, selY2;
    not (nsel, sel);
    and (selY1, Y1, nsel);
    and (selY2, Y2, sel);
    or (Y, selY1, selY2);

endmodule

// Testbench
module Guia_0701_tb;
    reg A, B, sel;
    wire Y1, Y2, Y;
    
    Guia_0701 uut (
        .A(A), 
        .B(B), 
        .sel(sel), 
        .Y1(Y1), 
        .Y2(Y2), 
        .Y(Y)
    );
    
    initial begin
        $display("A B sel | Y1 Y2 Y");
        $monitor("%b %b %b   | %b  %b  %b", A, B, sel, Y1, Y2, Y);
        
        A = 0; B = 0; sel = 0; #10;
        A = 0; B = 1; sel = 0; #10;
        A = 1; B = 0; sel = 0; #10;
        A = 1; B = 1; sel = 0; #10;
        
        A = 0; B = 0; sel = 1; #10;
        A = 0; B = 1; sel = 1; #10;
        A = 1; B = 0; sel = 1; #10;
        A = 1; B = 1; sel = 1; #10;
        
        $finish;
    end
endmodule
