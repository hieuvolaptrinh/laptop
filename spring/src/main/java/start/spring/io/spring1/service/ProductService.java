package start.spring.io.spring1.service;

import java.sql.Date;
// import java.lang.classfile.ClassFile.Option;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import start.spring.io.spring1.domain.Cart;
import start.spring.io.spring1.domain.CartDetail;
import start.spring.io.spring1.domain.Order;
import start.spring.io.spring1.domain.OrderDetail;
import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.domain.Product_;
import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.domain.DTO.ProductCriteriaDTO;
import start.spring.io.spring1.repository.CartDetailRepository;
import start.spring.io.spring1.repository.CartRepository;
import start.spring.io.spring1.repository.OrderDetailRepository;
import start.spring.io.spring1.repository.OrderRepository;
import start.spring.io.spring1.repository.ProductRepository;
import start.spring.io.spring1.service.specification.ProductSpec;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    // filter product
    // private Specification<Product> nameLike(String name) {
    // return (root, query, criteriaBuilder) ->
    // criteriaBuilder.like(root.get(Product_.productName), "%" + name + "%");
    // }
    public Page<Product> fetchProductsWith(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(pageable);
        }

        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpec = ProductSpec.matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpec = ProductSpec.matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }
        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpec = this.builtPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpec);
        }

        return this.productRepository.findAll(combinedSpec, pageable);
    }

    public Specification<Product> builtPriceSpecification(
            List<String> listPrice) {
        Specification<Product> combinedSpec = Specification.where(null); 
        for (String price : listPrice) {
            double min = 0, max = 0;
            switch (price) {
                case "duoi-10-trieu":
                    max = 10000000;
                    min = 1;

                    break;
                case "10-15-trieu":
                    min = 10000000;
                    max = 15000000;

                    break;
                case "15-20-trieu":
                    min = 15000000;
                    max = 20000000;

                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = Double.MAX_VALUE;

                    break;
                default:
                    break;
            }
            if (min != 0 && max != 0) {

                Specification<Product> rangeSpec = ProductSpec.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

    public Page<Product> fetchProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    // ---------------------- Test filter-----------------------
    // public Page<Product> fetchProductsWithMinPrice(Pageable pageable, double
    // minPrice) {
    // return this.productRepository.findAll(ProductSpec.minPrice(minPrice),
    // pageable);
    // }

    // public Page<Product> fetchProductsWithName(Pageable pageable, String name) {
    // return this.productRepository.findAll(ProductSpec.nameLike(name), pageable);
    // }

    // public Page<Product> fetchProductsWithMaxPrice(Pageable pageable, double
    // maxPrice) {
    // return this.productRepository.findAll(ProductSpec.maxPrice(maxPrice),
    // pageable);
    // }

    // public Page<Product> fetchProductsWithFactory(Pageable pageable, String
    // factory) {
    // return this.productRepository.findAll(ProductSpec.matchFactory(factory),
    // pageable);
    // }

    // public Page<Product> fetchProductsWithListFactory(Pageable pageable,
    // List<String> listFactory) {
    // return
    // this.productRepository.findAll(ProductSpec.matchListFactory(listFactory),
    // pageable);
    // }

    // public Page<Product> fetchProductsWithbetweenPrice(Pageable pageable, String
    // price) {
    // double min, max;
    // if (price.equals("duoi-10-trieu")) {
    // min = 0;
    // max = 10000000;
    // } else if (price.equals("10-15-trieu")) {
    // min = 10000000;
    // max = 15000000;

    // } else if (price.equals("15-20-trieu")) {
    // min = 15000000;
    // max = 20000000;
    // } else if (price.equals("tren-20-trieu")) {
    // min = 0;
    // max = 10000000;
    // } else {
    // return this.productRepository.findAll(pageable);

    // }
    // return this.productRepository.findAll(ProductSpec.betweenPrice(min, max),
    // pageable);
    // }

    public long countProduct() {
        return this.productRepository.count();

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
    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
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
                    cartDetail.setQuantity(quantity);
                    this.cartDetailRepository.save(cartDetail);

                    // update cart total quantity
                    cart.setTotalQuantity(cart.getTotalQuantity() + 1);
                    this.cartRepository.save(cart);

                    // update session totalQuantity
                    session.setAttribute("totalQuantity", cart.getTotalQuantity());

                } else {
                    oldCartDetail.setQuantity(oldCartDetail.getQuantity() + quantity);
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

    public void handlePlaceOrder(User currentUser, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {

        // create order detail
        Cart cart = this.cartRepository.findByUser(currentUser);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                // create order
                Order order = new Order();
                order.setUser(currentUser);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setOrderDate(new java.sql.Date(System.currentTimeMillis()));
                order.setStatus("PENDING");
                double totalPrice = 0;
                for (CartDetail cartDetail : cartDetails) {
                    totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
                }
                order.setTotalPrice(totalPrice);
                order = this.orderRepository.save(order); // gắn để lấy ra được id từ csdl

                for (CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    orderDetail.setProduct(cartDetail.getProduct());
                    this.orderDetailRepository.save(orderDetail);
                }
                // delete cart details -> cart
                for (CartDetail cartDetail : cartDetails)
                    this.cartDetailRepository.deleteById(cartDetail.getId());

                this.cartRepository.deleteById(cart.getId());

                session.setAttribute("totalQuantity", 0);
            }
        }
    }
}
