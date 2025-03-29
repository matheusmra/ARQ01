module Guia_0703 (
    input wire A, 
    input wire B,
    input wire sel_op,  
    input wire sel_grp, 
    output wire Y       
);


    wire Y1, Y2, Y3, Y4;
    and (Y1, A, B);  
    nand (Y2, A, B);
    or (Y3, A, B);   
    nor (Y4, A, B);  

    wire nsel_op, nsel_grp, selY1, selY2, selY3, selY4, Y_int1, Y_int2;
    
    not (nsel_op, sel_op);
    not (nsel_grp, sel_grp);
    
    and (selY1, Y1, nsel_op);
    and (selY2, Y2, sel_op);
    or (Y_int1, selY1, selY2); 
    
    and (selY3, Y3, nsel_op);
    and (selY4, Y4, sel_op);
    or (Y_int2, selY3, selY4); 
    
    and (Y1, Y_int1, sel_grp);
    and (Y2, Y_int2, nsel_grp);
    or (Y, Y1, Y2); 

endmodule

// Testbench
module Guia_0703_tb;
    reg A, B, sel_op, sel_grp;
    wire Y;
    
    Guia_0703 uut (
        .A(A), 
        .B(B), 
        .sel_op(sel_op), 
        .sel_grp(sel_grp), 
        .Y(Y)
    );
    
    initial begin
        $display("A B sel_op sel_grp | Y");
        $monitor("%b %b %b %b   | %b", A, B, sel_op, sel_grp, Y);
        
        A = 0; B = 0; sel_op = 0; sel_grp = 0; #10;
        A = 0; B = 1; sel_op = 0; sel_grp = 0; #10;
        A = 1; B = 0; sel_op = 0; sel_grp = 0; #10;
        A = 1; B = 1; sel_op = 0; sel_grp = 0; #10;
        
        A = 0; B = 0; sel_op = 1; sel_grp = 0; #10;
        A = 0; B = 1; sel_op = 1; sel_grp = 0; #10;
        A = 1; B = 0; sel_op = 1; sel_grp = 0; #10;
        A = 1; B = 1; sel_op = 1; sel_grp = 0; #10;
        
        A = 0; B = 0; sel_op = 0; sel_grp = 1; #10;
        A = 0; B = 1; sel_op = 0; sel_grp = 1; #10;
        A = 1; B = 0; sel_op = 0; sel_grp = 1; #10;
        A = 1; B = 1; sel_op = 0; sel_grp = 1; #10;
        
        A = 0; B = 0; sel_op = 1; sel_grp = 1; #10;
        A = 0; B = 1; sel_op = 1; sel_grp = 1; #10;
        A = 1; B = 0; sel_op = 1; sel_grp = 1; #10;
        A = 1; B = 1; sel_op = 1; sel_grp = 1; #10;
        
        $finish;
    end
endmodule
