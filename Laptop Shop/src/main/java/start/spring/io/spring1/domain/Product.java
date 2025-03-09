package start.spring.io.spring1.domain;

import java.util.*;

import org.hibernate.annotations.Check;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    @Column(name = "product_id")
    private long id;

    @NotNull
    @NotEmpty(message = "Tên sản phẩm không được để trống")
    @Column(columnDefinition = "NVARCHAR(255)")
    private String productName;

    @NotNull
    @DecimalMin(value = "0", inclusive = false, message = "Price phải lớn hơn 0")
    private double price;

    private String image;

    @NotNull
    @NotEmpty(message = "detailDesc không được để trống")
    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String detailDesc;

    @NotNull
    @NotEmpty(message = "shortDesc không được để trống")
    @Column(columnDefinition = "NVARCHAR(255)")
    private String shortDesc;

    @NotNull
    @Min(value = 1, message = "Số lượng cần lớn hơn hoặc bằng 1")
    private long quantity;

    // @Check(constraints = "sold >=0")
    private long sold;
    private String factory;
    private String target;

    // // 1:N order_product không nhất thiết phải khai báo trong Product vì trong
    // Order_Product đã khai báo đã có
    // @OneToMany(mappedBy = "product")
    // private List<OrderProduct> orderProducts;

    @OneToMany(mappedBy = "product")
    private List<CartDetail> cartDetail;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", productName=" + productName + ", price=" + price + ", image="
                + image + ", detailDesc=" + detailDesc + ", shortDesc=" + shortDesc + ", quantity=" + quantity
                + ", sold=" + sold + ", factory=" + factory + ", target=" + target + "]";
    }

    public List<CartDetail> getCartDetail() {
        return cartDetail;
    }

    public void setCartDetail(List<CartDetail> cartDetail) {
        this.cartDetail = cartDetail;
    }

}
