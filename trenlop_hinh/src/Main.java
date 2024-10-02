import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Hinh hinh = new Hinh();
        HinhTron ht = new HinhTron("tron", 2);
        System.out.println(ht.getR());

        ht.toString();
    }
}