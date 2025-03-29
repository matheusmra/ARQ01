module Guia_0707 (
    input wire [3:0] A,    
    input wire [3:0] B,    
    output wire sel       
);

    wire gt3, gt2, gt1, gt0; 

    and (gt3, A[3], ~B[3]);         
    and (gt2, A[2], ~B[2], ~(A[3] ^ B[3])); 
    and (gt1, A[1], ~B[1], ~(A[2] ^ B[2]), ~(A[3] ^ B[3]));
    and (gt0, A[0], ~B[0], ~(A[1] ^ B[1]), ~(A[2] ^ B[2]), ~(A[3] ^ B[3]));

    or (sel, gt3, gt2, gt1, gt0); 

endmodule


module Guia_0707_tb;
    reg [3:0] A, B;
    wire sel;

    Guia_0707 uut (
        .A(A),
        .B(B),
        .sel(sel)
    );

    initial begin
        $display("A    B    | sel");
        $monitor("%b %b | %b", A, B, sel);
        A = 4'b0000; B = 4'b0000; #10;
        A = 4'b0001; B = 4'b0000; #10;
        A = 4'b0010; B = 4'b0001; #10;
        A = 4'b0100; B = 4'b0011; #10;
        A = 4'b1000; B = 4'b0011; #10;
        A = 4'b1111; B = 4'b0000; #10;
        A = 4'b0000; B = 4'b1111; #10;
        A = 4'b0010; B = 4'b0101; #10;
        $finish;
    end
endmodule
