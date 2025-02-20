/*
Guia_0302.java
848813 - Matheus de Almeida Moreira
*/
public class Guia_0302 {

    public static int C1(int nbits, String x, int basex) {
        int valorD = Integer.parseInt(x, basex);
        String bin = Integer.toBinaryString(valorD);
        while (bin.length() < nbits) {
            bin = "0" + bin; 
        }

        int resp = Integer.parseInt(bin, 2);
        return ~resp & ((1 << nbits) - 1); 
    }

    public static int C2(int nbits, String x, int basex) {
        return C1(nbits, x, basex) + 1; 
    }

    public static void main(String[] args) {


        // a.) C1,6 (123(4)) = X(2)
        System.out.println("a.) C1,6 (123(4)) = " + Integer.toBinaryString(C1(6, "123", 4)));

        // b.) C1,8 (C4(16)) = X(2)
        System.out.println("b.) C1,8 (C4(16)) = " + Integer.toBinaryString(C1(8, "C4", 16)));

        // c.) C2,6 (312(4)) = X(2)
        System.out.println("c.) C2,6 (312(4)) = " + Integer.toBinaryString(C2(6, "312", 4)));

        // d.) C2,10 (153(8)) = X(2)
        System.out.println("d.) C2,10 (153(8)) = " + Integer.toBinaryString(C2(10, "153", 8)));

        // e.) C2,8 (7D(16)) = X(2)
        System.out.println("e.) C2,8 (7D(16)) = " + Integer.toBinaryString(C2(8, "7D", 16)));
    }
}
