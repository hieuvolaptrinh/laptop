public class HinhTron  extends Hinh{
   private double r;

    public HinhTron() {
        super();
    }
    public HinhTron(double r) {
        this.r = r;
    }

    public HinhTron(String tenHinh, double r) {
        super(tenHinh);
        this.r = r;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    @Override
    public void nhap() {
        super.nhap();
        System.out.println("nhập bán kính");
        this.r=sc.nextDouble();
    }

    @Override
    public void xuat() {
        System.out.println("bán kính là " + this.r);
        super.xuat();
    }


    @Override
    public String toString() {
        return "HinhTron{" +
                "r=" + r +
                '}';
    }
}
