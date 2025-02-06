public class Guia_0101 {
        public static String dec2bin(int x) {
            return Integer.toBinaryString(x);
        }
        public static void main(String[] args) {
        int a = 27;
        int b = 51;
        int c = 725;
        int d = 132;
        int e = 360;
        System.out.println("Guia_0101 - Tests");
        System.out.println("A)");
        System.out.println("Decimal = " + a);
        System.out.println("Binario = " + dec2bin(a));
        System.out.println();
        System.out.println("B)");
        System.out.println("Decimal = " + b);
        System.out.println("Binario = " + dec2bin(b));
        System.out.println();
        System.out.println("C)");
        System.out.println("Decimal = " + c);
        System.out.println("Binario = " + dec2bin(c));
        System.out.println();
        System.out.println("D)");
        System.out.println("Decimal = " + d);
        System.out.println("Binario = " + dec2bin(d));
        System.out.println();
        System.out.println("E)");
        System.out.println("Decimal = " + e);
        System.out.println("Binario = " + dec2bin(e));
        }
    }

