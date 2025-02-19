package start.spring.io.spring1.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.domain.Product_;

public class ProductSpec {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.PRODUCT_NAME),
                "%" + name + "%");
    }

    public static Specification<Product> minPrice(double minPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThan(root.get(Product_.PRICE),
                minPrice);
    }

    public static Specification<Product> maxPrice(double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.lessThan(root.get(Product_.PRICE),
                maxPrice);
    }

    public static Specification<Product> matchFactory(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.FACTORY),
                factory);
    }

    public static Specification<Product> matchListFactory(List<String> listFactory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(listFactory);
    }

    public static Specification<Product> betweenPrice(double minPrice, double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.greaterThan(root.get(Product_.PRICE), minPrice),
                criteriaBuilder.lessThan(root.get(Product_.PRICE), maxPrice));
    }

    public static Specification<Product> matchMultiplePrice(double minPrice, double maxPrice) {
        // return (root, query, criteriaBuilder) ->
        // criteriaBuilder.between(root.get(Product_.PRICE), minPrice, maxPrice);
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.greaterThan(root.get(Product_.PRICE), minPrice),
                criteriaBuilder.lessThan(root.get(Product_.PRICE), maxPrice));
    };

}
