// 848813 - Matheus de Almeida Moreira
public class Guia_0102 {
    public static int bin2dec(String binaryStr) {
        return Integer.parseInt(binaryStr, 2);
    }
    public static void main(String[] args) {
        System.out.println("10011(2) = " + bin2dec("10011") + "(10)");
        System.out.println("10101(2) = " + bin2dec("10101") + "(10)");
        System.out.println("10110(2) = " + bin2dec("10110") + "(10)");
        System.out.println("110010(2) = " + bin2dec("110010") + "(10)");
        System.out.println("111011(2) = " + bin2dec("111011") + "(10)");
    }
}