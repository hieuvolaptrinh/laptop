package start.spring.io.spring1.domain;
    

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Order_Product")
public class OrderProduct {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private long idOrderProduct;

    private long orderId;
    private long productId;
    private long quantity; // số lượng
    private double price; // giá

    @ManyToOne
    @JoinColumn(name = "orderId", insertable = false, updatable = false) // Chỉ định không insert hoặc update
    private Order order;

    @ManyToOne
    @JoinColumn(name = "productId", insertable = false, updatable = false) // Chỉ định không insert hoặc update
    private Product product;

    public long getIdOrderProduct() {
        return idOrderProduct;
    }

    public void setIdOrderProduct(long idOrderProduct) {
        this.idOrderProduct = idOrderProduct;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

}
