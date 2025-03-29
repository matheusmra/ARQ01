module Guia_0702 (
    input wire A, 
    input wire B,
    input wire sel,
    output wire Y   
);


    wire Y1, Y2;
    or (Y1, A, B);  
    nor (Y2, A, B); 

 
    wire nsel, selY1, selY2;
    not (nsel, sel);
    and (selY1, Y1, nsel);
    and (selY2, Y2, sel);
    or (Y, selY1, selY2);

endmodule

// Testbench
module Guia_0702_tb;
    reg A, B, sel;
    wire Y;
    
    Guia_0702 uut (
        .A(A), 
        .B(B), 
        .sel(sel), 
        .Y(Y)
    );
    
    initial begin
        $display("A B sel | Y");
        $monitor("%b %b %b   | %b", A, B, sel, Y);
        
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
