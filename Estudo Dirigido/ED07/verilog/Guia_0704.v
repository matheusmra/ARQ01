module Guia_0704 (
    input wire A, 
    input wire B,
    input wire sel0,  
    input wire sel1,  
    output wire Y     
);


    wire Y1, Y2, Y3, Y4;
    xor (Y1, A, B);  
    xnor (Y2, A, B);
    or (Y3, A, B);   
    nor (Y4, A, B);  


    wire nsel0, nsel1;
    wire selY1, selY2, selY3, selY4;
    wire sel01, sel02, Y_int1, Y_int2;

    not (nsel0, sel0);
    not (nsel1, sel1);
    
    and (selY1, Y2, nsel1, nsel0); 
    and (selY2, Y1, nsel1, sel0);  
    and (selY3, Y3, sel1, nsel0);  
    and (selY4, Y4, sel1, sel0);   

    or (Y, selY1, selY2, selY3, selY4); 

endmodule

// Testbench
module Guia_0704_tb;
    reg A, B, sel0, sel1;
    wire Y;
    
    Guia_0704 uut (
        .A(A), 
        .B(B), 
        .sel0(sel0), 
        .sel1(sel1), 
        .Y(Y)
    );
    
    initial begin
        $display("A B sel1 sel0 | Y");
        $monitor("%b %b %b %b   | %b", A, B, sel1, sel0, Y);
        
        A = 0; B = 0; sel1 = 0; sel0 = 0; #10;
        A = 0; B = 1; sel1 = 0; sel0 = 0; #10;
        A = 1; B = 0; sel1 = 0; sel0 = 0; #10;
        A = 1; B = 1; sel1 = 0; sel0 = 0; #10;
        
        A = 0; B = 0; sel1 = 0; sel0 = 1; #10;
        A = 0; B = 1; sel1 = 0; sel0 = 1; #10;
        A = 1; B = 0; sel1 = 0; sel0 = 1; #10;
        A = 1; B = 1; sel1 = 0; sel0 = 1; #10;
        
        A = 0; B = 0; sel1 = 1; sel0 = 0; #10;
        A = 0; B = 1; sel1 = 1; sel0 = 0; #10;
        A = 1; B = 0; sel1 = 1; sel0 = 0; #10;
        A = 1; B = 1; sel1 = 1; sel0 = 0; #10;
        
        A = 0; B = 0; sel1 = 1; sel0 = 1; #10;
        A = 0; B = 1; sel1 = 1; sel0 = 1; #10;
        A = 1; B = 0; sel1 = 1; sel0 = 1; #10;
        A = 1; B = 1; sel1 = 1; sel0 = 1; #10;
        
        $finish;
    end
endmodule