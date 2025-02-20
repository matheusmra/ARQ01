/*
Guia_0301.java
848813 - Matheus de Almeida Moreira
*/
public class Guia_0301{
    
    // Função para calcular Complemento de 1
    public static int C1(int nbits, int x) {
        return ~x & ((1 << nbits) - 1); // Inverter bits e limitar aos n bits
    }

    public static int C2(int nbits, int x) {
        return C1(nbits, x) + 1; 
    }

    public static void main(String[] args) {
        // Definição dos números e seus respectivos bits
        int a = 0b001011;  // 6 bits
        int b = 0b00001100;  // 8 bits
        int c = 0b100011; // 6 bits
        int d = 0b101001; // 7 bits
        int e = 0b111010; // 8 bits
        System.out.println("a = " + Integer.toBinaryString(a) + " -> C1(1011) = " + Integer.toBinaryString(C1(6, a)));
        System.out.println("b = " + Integer.toBinaryString(b) + " -> C1(1100) = " + Integer.toBinaryString(C1(8, b)));
        System.out.println("c = " + Integer.toBinaryString(c) + " -> C2(100011) = " + Integer.toBinaryString(C2(6, c)));
        System.out.println("d = " + Integer.toBinaryString(d) + " -> C2(101001) = " + Integer.toBinaryString(C2(7, d)));
        System.out.println("e = " + Integer.toBinaryString(e) + " -> C2(111010) = " + Integer.toBinaryString(C2(8, e)));
    }
}