public class Guia_0105{
    public static String asc2hex(String input) {
        StringBuilder hex = new StringBuilder();
        for (char ch : input.toCharArray()) {
            hex.append(String.format("%02X ", (int) ch));
        }
        return hex.toString().trim();
    }
    public static String hex2asc(String hex) {
        StringBuilder ascii = new StringBuilder();
        String[] hexBytes = hex.split(" ");
        for (String hexByte : hexBytes) {
            ascii.append((char) Integer.parseInt(hexByte, 16));
        }
        return ascii.toString();
    }
    public static String asc2bin(String input) {
        StringBuilder binary = new StringBuilder();
        for (char ch : input.toCharArray()) {
            binary.append(String.format("%08d ", Integer.parseInt(Integer.toBinaryString(ch))));
        }
        return binary.toString().trim();
    }
    public static String oct2asc(String octal) {
        StringBuilder ascii = new StringBuilder();
        String[] octalBytes = octal.split(" ");
        for (String octByte : octalBytes) {
            ascii.append((char) Integer.parseInt(octByte, 8));
        }
        return ascii.toString();
    }

    public static void main(String[] args) {
        System.out.println("a.) PUC-Minas = " + asc2hex("PUC-Minas"));
        System.out.println("b.) 2025-01 = " + asc2hex("2025-01"));
        System.out.println("c.) Belo Horizonte - M.G. = " + asc2bin("Belo Horizonte - M.G."));
        System.out.println("d.) 156 157 151 164 145 (8) = " + oct2asc("156 157 151 164 145"));
        System.out.println("e.) 4D 61 6E 68 61 (16) = " + hex2asc("4D 61 6E 68 61"));
    }
}