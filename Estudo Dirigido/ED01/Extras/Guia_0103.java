// 848813 - Matheus de Almeida Moreira

public class Guia_0103 {

    public static String dec24(int decimal) {
        if (decimal == 0) return "0";
        StringBuilder base4 = new StringBuilder();
        while (decimal > 0) {
            base4.insert(0, decimal % 4);
            decimal /= 4;
        }
        return base4.toString();
    }

    public static void printConversions(int[] numeros){
        System.out.println("Conversoes:");
        for (int num : numeros) {
            String base4 = dec24(num);
            String oct = Integer.toOctalString(num);
            String hex = Integer.toHexString(num).toUpperCase(); 
            System.out.println(num + "(10) = " + base4 + "(4)  = " + oct + " (8)  = " + hex + "(16)");
        }
    }

    public static void main(String[] args) {
        int[] numeros = {54, 67, 76, 157, 731};
        printConversions(numeros);
    }
}