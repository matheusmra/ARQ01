// 848813 - Matheus de Almeida Moreira

public class Guia_0201 {
    public static double bin2double(String binario) {
        int Index = binario.indexOf(',');
        if (Index == -1) {
            Index = binario.length();
        }
        String pInt = binario.substring(0, Index);
        String pDec = binario.substring(Index + 1);
        double decimal = 0.0;
        for (int i = 0; i < pInt.length(); i++) {
            if (pInt.charAt(pInt.length() - 1 - i) == '1') {
                decimal += Math.pow(2, i);
            }
        }
        for (int i = 0; i < pDec.length(); i++) {
            if (pDec.charAt(i) == '1') {
                decimal += Math.pow(2, -(i + 1));
            }
        }
        
        return decimal;
    }
    
    public static void main(String[] args) {
        String[] binarios = {
            "0,00101",
            "0,01101",
            "0,10001",
            "1,10111",
            "11,11101"
        };
        for (String binario : binarios) {
            double decimal = bin2double(binario);
            System.out.println(binario + "(2) = " + decimal + "(10)");
        }
    }
}