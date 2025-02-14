module operacoes_binarias;

    reg [7:0] a, b;
    reg [15:0] resultado_adicao, resultado_subtracao, resultado_multiplicacao, resultado_divisao, resultado_modulo;
    
    initial begin
        a = 8'b10101000; 
        b = 8'b01001100; 
        resultado_adicao = a + b;
        $display("Resultado da adição: %0b(2)", resultado_adicao);
        a = 8'b10000010; 
        b = 8'b01001000; 
        resultado_subtracao = a - b;
        $display("Resultado da subtração: %0b(2)", resultado_subtracao);
        a = 8'b10111000; 
        b = 8'b01000100; 
        resultado_multiplicacao = a * b;
        $display("Resultado da multiplicação: %0b(2)", resultado_multiplicacao);
        a = 8'b10110010; 
        b = 8'b01101100; 
        resultado_divisao = a / b;
        $display("Resultado da divisão: %b(2)", resultado_divisao);
        a = 8'b11011010;
        b = 8'b00001011; 
        resultado_modulo = a % b;
        $display("Resultado do módulo: %b(2)", resultado_modulo);
    end

endmodule
