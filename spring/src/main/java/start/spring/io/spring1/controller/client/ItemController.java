package start.spring.io.spring1.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.domain.Product_;
import start.spring.io.spring1.domain.DTO.ProductCriteriaDTO;
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
            ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
        int page = 1;

        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        Pageable pageable = null;

        // check sort by price
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).ascending()); // sort

            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).descending());

            } else {
                pageable = PageRequest.of(page - 1, 6);
            }

        } else {
            pageable = PageRequest.of(page - 1, 6);
        }

        // get current request url
        String queryString = request.getQueryString();

        if (queryString != null && !queryString.isBlank()) {
            // remove page
            queryString = queryString.replace("page=" + page, "");
        }

        Page<Product> pageProducts = this.productService.fetchProductsWith(pageable, productCriteriaDTO);

        List<Product> products = pageProducts.getContent().size() > 0 ? pageProducts.getContent()
                : new ArrayList<Product>();
        System.out.println(products);

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageProducts.getTotalPages());
        model.addAttribute("queryString", queryString);
        return "client/homepage/shop";
    }

}