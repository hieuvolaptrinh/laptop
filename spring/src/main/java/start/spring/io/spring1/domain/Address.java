package start.spring.io.spring1.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Address {

    @Id
    @Column(name = "address_id")
    private long id;

    private String country;
    private String city;
    private String district;
    private String street;

}
