package start.spring.io.spring1.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class OrderStatus {

    @Id
    @Column(name = "order_status_id")
    private long id;

    private String status;

}
