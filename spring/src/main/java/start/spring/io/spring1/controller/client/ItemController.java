package start.spring.io.spring1.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.service.ProductService;

import org.springframework.ui.Model;


@Controller
public class ItemController {

    private ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getDetailProduct(Model model, @PathVariable Long id) {
        Product product = this.productService.fetchProductById(id).get();
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @GetMapping("/shop")
    public String getUserPage(Model model,
            @RequestParam(name = "page") Optional<String> pageOptional,
            @RequestParam(name = "name") Optional<String> nameOptional,
            @RequestParam(name = "min-price") Optional<String> minOptional,
            @RequestParam(name = "max-price") Optional<String> maxOptional,
            @RequestParam(name = "factory") Optional<String> factoryOptional,
            @RequestParam(name = "price") Optional<String> priceOptional) {
        int page = 1;

        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

        Pageable pageable = PageRequest.of(page - 1, 6);

        // filter product
        String name = nameOptional.isPresent() ? nameOptional.get() : "";
        // Double minPrice = minOptional.isPresent() ?
        // Double.parseDouble(minOptional.get()) : 0;
        // Double maxPrice = maxOptional.isPresent() ?
        // Double.parseDouble(maxOptional.get()) : 0;

        List<String> listFactory = new ArrayList<>();

        listFactory = factoryOptional.isPresent() ? Arrays.asList(factoryOptional.get().split(","))
                : Collections.emptyList();

        // String price = priceOptional.isPresent() ? priceOptional.get() : "";

        List<String> listPrice = priceOptional.isPresent() ? Arrays.asList(priceOptional.get().split(","))
                : Collections.emptyList();
        Page<Product> pageProducts = null;

        // pageProducts = this.productService.fetchProductsWithName(pageable, name);

        // pageProducts = this.productService.fetchProductsWithMinPrice(pageable,
        // minPrice);

        // pageProducts = this.productService.fetchProducts(pageable);
        // if (!listFactory.isEmpty()) {
        // pageProducts = this.productService.fetchProductsWithListFactory(pageable,
        // listFactory);
        // } else {
        // pageProducts = this.productService.fetchProducts(pageable);
        // }

        // pageProducts = this.productService.fetchProductsWithbetweenPrice(pageable,
        // price);
        // search by price

        try {
            // Thực hiện lọc sản phẩm dựa trên giá
            pageProducts = this.productService.fetchProductsWithMultiplePrice(pageable, listPrice);

            // Kiểm tra nếu không có kết quả
            if (pageProducts == null || pageProducts.isEmpty()) {
                model.addAttribute("products", Collections.emptyList());
                model.addAttribute("currentPage", 1);
                model.addAttribute("totalPages", 0);
            } else {
                List<Product> products = pageProducts.getContent();
                model.addAttribute("products", products);
                model.addAttribute("currentPage", page);
                model.addAttribute("totalPages", pageProducts.getTotalPages());
            }
        } catch (Exception e) {
            System.out.println("Error fetching products: " + e.getMessage());
            model.addAttribute("products", Collections.emptyList());
            model.addAttribute("currentPage", 1);
            model.addAttribute("totalPages", 0);
        }

        List<Product> products = pageProducts.getContent();
        System.out.println(products);

        // model.addAttribute("products", products);
        // model.addAttribute("currentPage", page);
        // model.addAttribute("totalPages", pageProducts.getTotalPages());

        return "client/homepage/shop";
    }

}