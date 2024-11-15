package start.spring.io.spring1.service;

// import java.lang.classfile.ClassFile.Option;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }


    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> fetchProductById(Long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(Long id) {
        this.productRepository.deleteById(id);
    }
}
