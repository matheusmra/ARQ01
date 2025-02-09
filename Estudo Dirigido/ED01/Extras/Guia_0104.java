// 848813 - Matheus de Almeida Moreira
public class Guia_0104 {
    public static int bin2dec(String binary) {
        return Integer.parseInt(binary, 2);
    }
    public static String binToBase(String binary, int base) {
        int decimal = bin2dec(binary);
        return Integer.toString(decimal, base).toUpperCase();
    }

    public static void main(String[] args) {
        System.out.println("a.) 10110(2) = " + binToBase("10110(4)", 4));
        System.out.println("b.) 11011(2) = " + binToBase("11011(8)", 8));
        System.out.println("c.) 100100(2) = " + binToBase("100100(16)", 16));
        System.out.println("d.) 101011(2) = " + binToBase("101011(8)", 8));
        System.out.println("e.) 101100(2) = " + binToBase("101100(4)", 4));
    }
}
