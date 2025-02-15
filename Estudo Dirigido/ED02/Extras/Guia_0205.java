// 848813 - Matheus de Almeida Moreira
public class Guia_0205 {
    public static String dbinEval(String bin1, String op, String bin2) {
        double num1 = bin2dec(bin1);
        double num2 = bin2dec(bin2);
        double result = 0;
        switch (op) {
            case "+":
                result = num1 + num2;
                break;
            case "-":
                result = num1 - num2;
                break;
            case "*":
                result = num1 * num2;
                break;
            case "/":
                if (num2 != 0) {
                    result = num1 / num2;
                } else {
                    return "O valor deve ser maior que 0";
                }
                break;
            case "%":
                if (num2 != 0) {
                    result = num1 % num2;
                } else {
                    return "O valor deve ser maior que 0";
                }
                break;
            default:
                return "Operador invalido";
        }
    
        return dec2bi(result);
    }
    public static double bin2dec(String binary) {
        return Integer.parseInt(binary.split("\\.")[0], 2) + ((binary.contains(".")) ? fracbi2dec(binary.split("\\.")[1]) : 0);
    }
    public static double fracbi2dec(String frac) {
        double result = 0;
        for (int i = 0; i < frac.length(); i++) {
            if (frac.charAt(i) == '1') {
                result += Math.pow(2, -(i + 1));
            }
        }
        return result;
    }
    public static String dec2bi(double num) {
        int pInt = (int) num;
        double pFrac = num - pInt;
        String Binario = Integer.toBinaryString(pInt);
        StringBuilder Binariofrac = new StringBuilder();
        while (pFrac > 0 && Binariofrac.length() < 5) { // Limita a parta fracionada em 5 bits
            pFrac *= 2;
            if (pFrac >= 1) {
                Binariofrac.append("1");
                pFrac -= 1;
            } else {
                Binariofrac.append("0");
            }
        }
        return Binariofrac.length() > 0 ? Binario + "," + Binariofrac.toString() : Binario;
    }
    
    public static void main(String[] args) {
        System.out.println(dbinEval("101.01", "+", "10.011") + "(2)"); 
        System.out.println(dbinEval("1000.001", "-", "10.01") + "(2)"); 
        System.out.println(dbinEval("101.110", "*", "10.001") + "(2)"); 
        System.out.println(dbinEval("10110.01", "/", "11.011") + "(2)"); 
        System.out.println(dbinEval("1101101", "%", "1011") + "(2)"); 
    }
}
