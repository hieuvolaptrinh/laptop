import java.util.Scanner;

public class Hinh {
    protected Scanner sc;
    private String tenHinh;

    public Hinh(String tenHinh) {
        this.tenHinh = tenHinh;
    }

    public Hinh() {
        sc = new Scanner(System.in);
    }

    public void nhap() {
        System.out.println("nhập teenn hình ");
        this.tenHinh = sc.nextLine();
    }

    public void xuat() {
        System.out.println("hinh " + this.tenHinh);
    }

    public String getTenHinh() {
        return tenHinh;
    }

    public void setTenHinh(String tenHinh) {
        this.tenHinh = tenHinh;
    }

    @Override
    public String toString() {
        return "Hinh{" + ", tenHinh='" + tenHinh + '\'' +
                '}';
    }
}
