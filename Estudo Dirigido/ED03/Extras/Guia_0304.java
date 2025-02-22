

public class Guia_0304 {
    public static String convert2Base(int num, int base) {
        StringBuilder result = new StringBuilder();
        
        while (num > 0) {
            int rr = num % base;
            result.insert(0, Integer.toString(rr, base));
            num /= base;
        }
        
        return result.toString();
    }


    public static String twoComplement(int num, int bits) {
        int mask = (1 << bits) - 1; 
        num = (~num & mask) + 1;  
        return convert2Base(num, 2); 
    }


    public static String baseEval(int x, String op, int y, int base, int bits) {
        if (op.equals("-")) {
            int comp2 = Integer.parseInt(twoComplement(y, bits), 2);
            int result = x + comp2;  
            return convert2Base(result, base);  
        }
        return "";
    }

    // Função principal
    public static void main(String[] args) {


        System.out.println("Resultado da operacao 11101(2) - 1101(2): ");
        int x1 = Integer.parseInt("11101", 2); // 11101 em binário
        int y1 = Integer.parseInt("01101", 2); // 1101 em binário com 5 bits
        String result1 = baseEval(x1, "-", y1, 2, 5);
        System.out.println("Resultado (em binario): " + result1);

        System.out.println("\nResultado da operacao 101,1001(2) - 10,01(2): ");
        int x2 = Integer.parseInt("1011001", 2);  // 101.1001(2) sem vírgula
        int y2 = Integer.parseInt("10010", 2);    // 10.01(2) sem vírgula
        String result2 = baseEval(x2, "-", y2, 2, 7);
        System.out.println("Resultado (em binario): " + result2);

        System.out.println("\nResultado da operacao 321(4) - 213(4): ");
        int x3 = Integer.parseInt("321", 4); // Convertendo 321(4) para binário
        int y3 = Integer.parseInt("213", 4); // Convertendo 213(4) para binário
        String result3 = baseEval(x3, "-", y3, 4, 5); // Usando 6 bits
        System.out.println("Resultado (em base 4): " + result3);

        System.out.println("\nResultado da operacao 354(8) - 265(8): ");
        int x4 = Integer.parseInt("354", 8); // Convertendo 354(8) para binário
        int y4 = Integer.parseInt("265", 8); // Convertendo 265(8) para binário
        String result4 = baseEval(x4, "-", y4, 8, 6); // Usando 6 bits
        System.out.println("Resultado (em base octal): " + result4);

        System.out.println("\nResultado da operacao 6A2(16) - C14(16): ");
        int x5 = Integer.parseInt("6A2", 16); // Convertendo 6A2(16) para binário
        int y5 = Integer.parseInt("C14", 16); // Convertendo C14(16) para binário
        String result5 = baseEval(x5, "-", y5, 16, 12); // Usando 12 bits
        System.out.println("Resultado (em hexadecimal): " + result5);
    }
}
