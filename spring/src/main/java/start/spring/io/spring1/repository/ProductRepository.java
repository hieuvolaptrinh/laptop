package start.spring.io.spring1.repository;

import java.util.List;
import java.util.Optional;
// import java.lang.classfile.ClassFile.Option;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import start.spring.io.spring1.domain.Product;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;

import org.springframework.stereotype.Repository;


@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    List<Product> findAll();

    List<Product> findByProductName(String productName);

    Optional<Product> findByProductId(Long id);

    void deleteById(Long id);
}
