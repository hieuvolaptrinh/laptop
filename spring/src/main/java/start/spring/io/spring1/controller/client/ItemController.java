package start.spring.io.spring1.controller.client;

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
    // viết theo mô hình dependency injection

    private ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    // lấy ra thông tin sản phẩm hiển thị cho người dùng thấy

    @GetMapping("/product/{id}")
    public String getDetailProduct(Model model, @PathVariable Long id) {
        Product product = this.productService.fetchProductById(id).get();
        model.addAttribute("product",product);
        return "client/product/detail";
    }

}