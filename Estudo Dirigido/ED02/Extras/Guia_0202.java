// 848813 - Matheus de Almeida Moreira
public class Guia_0202 {

    public static String double2bin(double num) {
        int pInt = (int) num;
        double pDec = num - pInt;
        String binarioInteiro = Integer.toBinaryString(pInt);
        StringBuilder binarioDecimal = new StringBuilder();
        while (pDec > 0) {
            pDec *= 2;
            int bit = (int) pDec;
            binarioDecimal.append(bit);
            pDec -= bit;
        }
        if (binarioDecimal.length() > 0) {
            return binarioInteiro + "." + binarioDecimal.toString();
        } else {
            return binarioInteiro;
        }
    }
    public static void main(String[] args) {
        System.out.println("0,625000 (10) = " + double2bin(0.625) + "(2)");
        System.out.println("1,750000 (10) = " + double2bin(1.75) + "(2)");
        System.out.println("3,125000 (10) = " + double2bin(3.125) + "(2)");
        System.out.println("4,312500 (10) = " + double2bin(4.3125) + "(2)");
        System.out.println("7,875000 (10) = " + double2bin(7.875)  + "(2)");
    }

}
