public class Guia_0303 {

    // Função para determinar o valor positivo equivalente ao complemento de dois
    public static int sbin2dec(String binario) {
        // Passo 1: Subtrair 1 do número binário
        int numDecimal = Integer.parseInt(binario, 2);
        numDecimal = numDecimal - 1;

        // Passo 2: Inverter os bits
        String binComplementoDeUm = Integer.toBinaryString(numDecimal);
        
        // Preencher com zeros à esquerda para manter o tamanho original
        while (binComplementoDeUm.length() < binario.length()) {
            binComplementoDeUm = "0" + binComplementoDeUm;
        }

        // Passo 3: Inverter os bits (complemento de 1 para complemento de 2)
        StringBuilder resultadoInvertido = new StringBuilder();
        for (int i = 0; i < binComplementoDeUm.length(); i++) {
            char bit = binComplementoDeUm.charAt(i);
            resultadoInvertido.append(bit == '0' ? '1' : '0');
        }

        // Converter o número binário invertido para decimal
        return Integer.parseInt(resultadoInvertido.toString(), 2);
    }

    public static void main(String[] args) {
        // Exemplos de conversões:

        // a) 10101(2) = X(10)
        String bin1 = "10101";
        int dec1 = sbin2dec(bin1);
        System.out.println(bin1 + "(2) = " + dec1 + "(10)");

        // b) 110101(2) = X(10)
        String bin2 = "110101";
        int dec2 = sbin2dec(bin2);
        System.out.println(bin2 + "(2) = " + dec2 + "(10)");

        // c) 100110(2) = X(2) (em binário)
        String bin3 = "100110";
        int bin3Decimal = sbin2dec(bin3);
        System.out.println(bin3 + "(2) = " + Integer.toBinaryString(bin3Decimal) + "(2)");

        // d) 1010111(2) = X(2) (em binário)
        String bin4 = "1010111";
        int bin4Decimal = sbin2dec(bin4);
        System.out.println(bin4 + "(2) = " + Integer.toBinaryString(bin4Decimal) + "(2)");

        // e) 1110101(2) = X(16)
        String bin5 = "1110101";
        String hex5 = Integer.toHexString(sbin2dec(bin5)).toUpperCase();
        System.out.println(bin5 + "(2) = " + hex5 + "(16)");
    }
}
