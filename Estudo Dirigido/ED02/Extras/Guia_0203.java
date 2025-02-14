// 848813 - Matheus de Almeida Moreira
public class Guia_0203 {
    public static String dbin2base(int base, String x) {
        String[] partes = x.split(",");
        String parteInteira = partes[0];
        String parteDecimal = (partes.length > 1) ? partes[1] : "";
        String resultadoInteiro = Integer.toString(Integer.parseInt(parteInteira, 2), base).toUpperCase();
        StringBuilder resultadoDecimal = new StringBuilder();
        double decimal = 0;
        for (int i = 0; i < parteDecimal.length(); i++) {
            if (parteDecimal.charAt(i) == '1') {
                decimal += Math.pow(2, -(i + 1));
            }
        }
        for (int i = 0; i < 5; i++) { 
            decimal *= base;
            int inteiro = (int) decimal;
            resultadoDecimal.append(Integer.toString(inteiro, base).toUpperCase());
            decimal -= inteiro;

            if (decimal == 0) {
                break;
            }
        }
        if (resultadoDecimal.length() > 0) {
            return resultadoInteiro + "," + resultadoDecimal.toString();
        } else {
            return resultadoInteiro;
        }
    }

    public static void main(String[] args) {
        System.out.println("a) 0,011010(2) = " + dbin2base(4, "0,011010") + "(4)");
        System.out.println("b) 0,100011(2) = " + dbin2base(8, "0,100011") + "(8)");
        System.out.println("c) 0,100101(2) = " + dbin2base(16, "0,100101") + "(16)");
        System.out.println("d) 1,111001(2) = " + dbin2base(8, "1,111001") + "(8)");
        System.out.println("e) 1011,1101(2) = " + dbin2base(16, "1011,1101") + "(16)");
    }
}
