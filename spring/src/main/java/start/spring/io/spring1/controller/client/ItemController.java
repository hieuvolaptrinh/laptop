package start.spring.io.spring1.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.service.ProductService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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
    public String getUserPage(Model model, @RequestParam(name = "page") Optional<String> optionPage) {
        int page = 1;

        try {
            if (optionPage.isPresent()) {
                page = Integer.parseInt(optionPage.get());
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        Pageable pageable = PageRequest.of(page - 1, 6);

        Page<Product> pageProducts = this.productService.fetchProducts(pageable);
        List<Product> products = pageProducts.getContent();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageProducts.getTotalPages());

        return "client/homepage/shop";
    }

}