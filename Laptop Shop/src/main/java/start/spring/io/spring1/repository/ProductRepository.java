package start.spring.io.spring1.repository;

import java.util.List;
import java.util.Optional;

import javax.swing.text.html.HTMLDocument.HTMLReader.SpecialAction;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import start.spring.io.spring1.domain.Product;

import org.springframework.data.repository.query.Param;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
        Page<Product> findAll(Pageable pageable);

        Page<Product> findAll(Specification<Product> specification, Pageable pageable);

        List<Product> findByProductName(String productName);

        Optional<Product> findById(Long id);

        void deleteById(Long id);

        @Query(value = "SELECT u.fullName, p.productName " +
                        "FROM users u " +
                        "JOIN order o ON u.id = o.userId " +
                        "JOIN orderProduct op ON o.id = op.orderId " +
                        "JOIN product p ON op.productId = p.productId " +
                        "WHERE u.id = :userId AND p.productId = :productId", nativeQuery = true)
        List<Object[]> findProductByUserIdAndProductId(@Param("userId") Long userId,
                        @Param("productId") Long productId);

        // @GetMapping("/products")
        // public String getProducts(@RequestParam("userId") Long userId,
        // @RequestParam("productId") Long productId,
        // Model model) {
        // List<Object[]> results =
        // productRepository.findProductByUserIdAndProductId(userId, productId);

        // // Chuyển đổi kết quả từ Object[] thành một dạng dễ sử dụng trong view
        // List<ProductInfo> productInfoList = new ArrayList<>();
        // for (Object[] result : results) {
        // String fullName = (String) result[0];
        // String productName = (String) result[1];
        // productInfoList.add(new ProductInfo(fullName, productName));
        // }

        // // Thêm vào model để truyền đến view
        // model.addAttribute("productInfoList", productInfoList);

        // return "productView"; // Tên của view (JSP, Thymeleaf...)
        // }

        // @Query("SELECT u.fullName, p.productName FROM User u " +
        // "JOIN u.orders o " +
        // "JOIN o.orderProducts op " +
        // "JOIN op.product p " +
        // "WHERE u.id = :userId AND p.productId = :productId")
        // List<Object[]> findProductByUserIdAndProductId(@Param("userId") Long userId,
        // @Param("productId") Long productId);

        // public List<Object[]> findStudentsByLastName(String lastName) {
        // String hql = "SELECT s.id, s.lastName FROM Student s WHERE s.lastName =
        // :lastName";
        // return entityManager.createQuery(hql, Object[].class)
        // .setParameter("lastName", lastName)
        // .getResultList();
        // }

}
