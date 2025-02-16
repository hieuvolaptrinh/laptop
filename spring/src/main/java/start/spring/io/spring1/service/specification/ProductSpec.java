package start.spring.io.spring1.service.specification;

import org.springframework.data.jpa.domain.Specification;

import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.domain.Product_;

public class ProductSpec {
    static public Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.productName), "%" + name + "%");
    }
}
