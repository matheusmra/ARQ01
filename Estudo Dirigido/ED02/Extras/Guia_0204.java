public class Guia_0204 {
    public static String dbase2base(int base1, int base2, String x){
        double decimal = base2dec(x, base1);
        return dec2base(decimal, base2);
    }
    public static double base2dec(String number, int base){
        String[] parts = number.split(",");
        int pInteira = Integer.parseInt(parts[0], base);
        double pFrac = (parts.length > 1) ? fracbase2dec(parts[1], base) : 0;
        return pInteira + pFrac;
    }
    public static double fracbase2dec(String frac, int base){
        double result = 0;
            for (int i = 0; i < frac.length(); i++) {
                int num = Character.digit(frac.charAt(i), base);
                result += num / Math.pow(base, i + 1);
            }
        return result;
    }
    public static String dec2base(double num, int base){
        int pInt = (int) num;
        double frac = num - pInt;
        String intBase = Integer.toString(pInt, base).toUpperCase();
        StringBuilder fracBase = new StringBuilder();
        while (frac > 0 && fracBase.length() < 9){ 
            frac *= base;
            int digito = (int) frac;
            fracBase.append(Integer.toString(digito, base).toUpperCase());
            frac -= digito;
        }
        return fracBase.length() > 0 ? intBase + "," + fracBase.toString() : intBase;
    }
    public static void main(String[] args){
        System.out.println(dbase2base(4, 2, "0,231")); 
        System.out.println(dbase2base(16, 4, "0,5C2")); 
        System.out.println(dbase2base(8, 2, "0,735")); 
        System.out.println(dbase2base(8, 4, "6,2345")); 
        System.out.println(dbase2base(16, 4, "B,A5E"));
    }
}
