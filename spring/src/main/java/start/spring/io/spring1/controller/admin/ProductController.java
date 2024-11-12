
package start.spring.io.spring1.controller.admin;

import java.util.List;
import java.util.Optional;

import javax.naming.Binding;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.service.ProductService;
import start.spring.io.spring1.service.UploadService;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
class ProductController {
    // DI: dependency injection
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> products = this.productService.fetchProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    // hiện ra giao diện tạo sp
    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";

    }

    // tạo mới một sản phẩm
    @PostMapping("/admin/product/create")
    public String postCreateProduct(Model model, @ModelAttribute("newProduct") @Valid Product hieuvoProduct,
            BindingResult newProductBindingResult,
            @RequestParam("productImage") MultipartFile prducFile) {
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        for (FieldError field : newProductBindingResult.getFieldErrors()) {
            System.out.println("field: " + field);

        }
        String imgProduct = this.uploadService.handleSaveUploadFile(prducFile, "product"); // để chỉ lấy 1 file lưu
                                                                                           // ten ở csdl
        // this.uploadService.multiple_handleSaveUploadFile(prducFiles, "product");
        // lưu file nhiều hình ảnh

        hieuvoProduct.setImage(imgProduct);
        this.productService.createProduct(hieuvoProduct);
        return "redirect:/admin/product";
    }

    // xem chi tiết sản phẩm
    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {

        Optional<Product> productOptional = this.productService.fetchProductById(id);
        if (productOptional.isPresent()) {
            model.addAttribute("product", productOptional.get());
            return "admin/product/detail";
        } else {
            return "error/404";
        }
    }

    // xóa sản phẩm
    @GetMapping("/admin/product/delete/{id}")
    public String getMethodName(Model model, @PathVariable long id) {
        model.addAttribute("productId", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postMethodName(Model model, @ModelAttribute("newProduct") Product pr) {
        this.productService.deleteProductById(pr.getProductId());
        return "redirect:/admin/product";
    }

}