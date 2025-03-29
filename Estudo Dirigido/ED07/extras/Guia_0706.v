module Guia_0706 (
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire sel,
    output wire Y
);

    wire x0, x1, x2, x3;
    wire xn0, xn1, xn2, xn3;
    
    xor (x0, A[0], B[0]);
    xor (x1, A[1], B[1]);
    xor (x2, A[2], B[2]);
    xor (x3, A[3], B[3]);
    
    xnor (xn0, A[0], B[0]);
    xnor (xn1, A[1], B[1]);
    xnor (xn2, A[2], B[2]);
    xnor (xn3, A[3], B[3]);

    wire eq, neq;
    and (eq, xn0, xn1, xn2, xn3); 
    or (neq, x0, x1, x2, x3);

    wire nsel, sel_eq, sel_neq;
    not (nsel, sel);
    and (sel_eq, eq, sel);
    and (sel_neq, neq, nsel);
    or (Y, sel_eq, sel_neq);

endmodule

// Testbench
module Guia_0706_tb;
    reg [3:0] A, B;
    reg sel;
    wire Y;
    
    Guia_0706 uut (
        .A(A), 
        .B(B), 
        .sel(sel), 
        .Y(Y)
    );
    
    initial begin
        $display("A    B    sel | Y");
        $monitor("%b %b %b | %b", A, B, sel, Y);
        
        A = 4'b0000; B = 4'b0000; sel = 0; #10;
        A = 4'b0000; B = 4'b0000; sel = 1; #10;
        A = 4'b1010; B = 4'b1010; sel = 0; #10;
        A = 4'b1010; B = 4'b1010; sel = 1; #10;
        A = 4'b1100; B = 4'b1001; sel = 0; #10;
        A = 4'b1100; B = 4'b1001; sel = 1; #10;
        A = 4'b1111; B = 4'b0000; sel = 0; #10;
        A = 4'b1111; B = 4'b0000; sel = 1; #10;
        
        $finish;
    end
endmodule
