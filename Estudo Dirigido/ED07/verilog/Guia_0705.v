module Guia_0705 (
    input wire A, 
    input wire B,
    input wire neg,     
    input wire [2:0] sel, 
    output wire Y        
);

   
    wire B_neg;
    xor (B_neg, B, neg);


    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6;
    not (Y0, A);    
    and (Y1, A, B_neg);   
    nand (Y2, A, B_neg); 
    or (Y3, A, B_neg);   
    nor (Y4, A, B_neg);   
    xor (Y5, A, B_neg);   
    xnor (Y6, A, B_neg);  

    wire nsel0, nsel1, nsel2;
    wire selY0, selY1, selY2, selY3, selY4, selY5, selY6;

    not (nsel0, sel[0]);
    not (nsel1, sel[1]);
    not (nsel2, sel[2]);
    
    and (selY0, Y0, nsel2, nsel1, nsel0); 
    and (selY1, Y1, nsel2, nsel1, sel[0]); 
    and (selY2, Y2, nsel2, sel[1], nsel0); 
    and (selY3, Y3, nsel2, sel[1], sel[0]); 
    and (selY4, Y4, sel[2], nsel1, nsel0); 
    and (selY5, Y5, sel[2], nsel1, sel[0]); 
    and (selY6, Y6, sel[2], sel[1], nsel0); 
    
    or (Y, selY0, selY1, selY2, selY3, selY4, selY5, selY6); 

endmodule

// Testbench
module Guia_0705_tb;
    reg A, B, neg;
    reg [2:0] sel;
    wire Y;
    
    Guia_0705 uut (
        .A(A), 
        .B(B), 
        .neg(neg),
        .sel(sel), 
        .Y(Y)
    );
    
    initial begin
        $display("A B neg sel | Y");
        $monitor("%b %b %b %b | %b", A, B, neg, sel, Y);
        
        for (integer i = 0; i < 8; i = i + 1) begin
            A = 0; B = 0; neg = 0; sel = i; #10;
            A = 0; B = 1; neg = 0; sel = i; #10;
            A = 1; B = 0; neg = 0; sel = i; #10;
            A = 1; B = 1; neg = 0; sel = i; #10;
            
            A = 0; B = 0; neg = 1; sel = i; #10;
            A = 0; B = 1; neg = 1; sel = i; #10;
            A = 1; B = 0; neg = 1; sel = i; #10;
            A = 1; B = 1; neg = 1; sel = i; #10;
        end
        
        $finish;
    end
endmodule
