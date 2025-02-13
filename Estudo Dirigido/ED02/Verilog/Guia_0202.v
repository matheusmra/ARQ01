/*

 Matheus de Almeida Moreira - 848813
 
*/
module Guia_0202;
    // define data
    real a  = 0.6250;    // decimal
    real b  = 1.750;    // decimal
    real c  = 3.125;    // decimal
    real d  = 4.3125;  // decimal
    real e  = 7.875;     // decimal
    integer x1 = 7;      // counter
    integer x2 = 7;      // counter
    integer x3 = 7;      // counter
    integer x4 = 7;      // counter
    integer x5 = 7;      // counter
    reg [7:0] b1 = 0;    // binary
    reg [7:0] b2 = 0;    // binary
    reg [7:0] b3 = 0;    // binary
    reg [7:0] b4 = 0;    // binary
    reg [7:0] b5 = 0;    // binary
    integer int_part;    // parte inteira
    real frac_part;      // parte fracionária
    reg [7:0] int_bin;   // parte inteira em binário

    // Função para converter a parte inteira para binário
    function [7:0] int_to_bin;
        input integer num;
        integer i;
        begin
            int_to_bin = 0;
            i = 0;
            while (num > 0) begin
                int_to_bin[i] = num % 2;
                num = num / 2;
                i = i + 1;
            end
        end
    endfunction

    // actions
    initial begin : main

        int_part = $floor(a); 
        frac_part = a - int_part;
        int_bin = int_to_bin(int_part);
        while (frac_part > 0 && x1 >= 0) begin
            frac_part = frac_part * 2.0;
            if (frac_part >= 1.0) begin
                b1[x1] = 1;
                frac_part = frac_part - 1.0;
            end else begin
                b1[x1] = 0;
            end
            x1 = x1 - 1;
        end

        int_part = $floor(b); 
        frac_part = b - int_part;
        int_bin = int_to_bin(int_part);
        while (frac_part > 0 && x2 >= 0) begin
            frac_part = frac_part * 2.0;
            if (frac_part >= 1.0) begin
                b2[x2] = 1;
                frac_part = frac_part - 1.0;
            end else begin
                b2[x2] = 0;
            end
            x2 = x2 - 1;
        end


        int_part = $floor(c); 
        frac_part = c - int_part;
        int_bin = int_to_bin(int_part);
        while (frac_part > 0 && x3 >= 0) begin
            frac_part = frac_part * 2.0;
            if (frac_part >= 1.0) begin
                b3[x3] = 1;
                frac_part = frac_part - 1.0;
            end else begin
                b3[x3] = 0;
            end
            x3 = x3 - 1;
        end


        int_part = $floor(d); 
        frac_part = d - int_part;
        int_bin = int_to_bin(int_part);
        while (frac_part > 0 && x4 >= 0) begin
            frac_part = frac_part * 2.0;
            if (frac_part >= 1.0) begin
                b4[x4] = 1;
                frac_part = frac_part - 1.0;
            end else begin
                b4[x4] = 0;
            end
            x4 = x4 - 1;
        end


        int_part = $floor(e); 
        frac_part = e - int_part;
        int_bin = int_to_bin(int_part);
        while (frac_part > 0 && x5 >= 0) begin
            frac_part = frac_part * 2.0;
            if (frac_part >= 1.0) begin
                b5[x5] = 1;
                frac_part = frac_part - 1.0;
            end else begin
                b5[x5] = 0;
            end
            x5 = x5 - 1;
        end

        // Exibindo resultados
        $display("%f(10) = %0b.%b(2)", x1, int_to_bin($floor(x1)), b1);
        $display("%f(10) = %0b.%b(2)", x2, int_to_bin($floor(x2)), b2);
        $display("%f(10) = %0b.%b(2)", x3, int_to_bin($floor(x3)), b3);
        $display("%f(10) = %0b.%b(2)", x4, int_to_bin($floor(x4)), b4);
        $display("%f(10) = %0b.%b(2)", x5, int_to_bin($floor(x5)), b5);
    end // main
endmodule // Guia_0202