package start.spring.io.spring1.service;

// import java.lang.classfile.ClassFile.Option;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import start.spring.io.spring1.domain.Cart;
import start.spring.io.spring1.domain.CartDetail;
import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.repository.CartDetailRepository;
import start.spring.io.spring1.repository.CartRepository;
import start.spring.io.spring1.repository.ProductRepository;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
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

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    //
    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đá có Cart chửa ? chưa=> tạo
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setTotalQuantity(0);
                cart = this.cartRepository.save(otherCart);
            }

            // save CartDetail
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {

                Product realProduct = productOptional.get();
                // kiểm tra xem sản phẩm đã được thêm vào rồi hay chưa
                CartDetail oldCartDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (oldCartDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(realProduct);
                    cartDetail.setPrice(realProduct.getPrice());
                    cartDetail.setQuantity(1);
                    this.cartDetailRepository.save(cartDetail);

                    // update cart total quantity
                    cart.setTotalQuantity(cart.getTotalQuantity() + 1);
                    this.cartRepository.save(cart);

                    // update session totalQuantity
                    session.setAttribute("totalQuantity", cart.getTotalQuantity());

                } else {
                    oldCartDetail.setQuantity(oldCartDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldCartDetail);
                }

            }

        }
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart cart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);
            if (cart.getTotalQuantity() > 1) {
                cart.setTotalQuantity(cart.getTotalQuantity() - 1);
                this.cartRepository.save(cart); // update cart
                session.setAttribute("totalQuantity", cart.getTotalQuantity());
            } else {
                this.cartRepository.delete(cart);
                session.setAttribute("totalQuantity", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }
}
