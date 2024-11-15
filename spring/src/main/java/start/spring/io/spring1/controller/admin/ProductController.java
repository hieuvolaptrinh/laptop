
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
            @RequestParam("productImage") MultipartFile producFile) {
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        for (FieldError field : newProductBindingResult.getFieldErrors()) {
            System.out.println("field: " + field);

        }
        String imgProduct = this.uploadService.handleSaveUploadFile(producFile, "product"); // để chỉ lấy 1 file lưu
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
            return "admin/error";
        }
    }

    // xóa sản phẩm
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProduct(Model model, @PathVariable long id) {
        model.addAttribute("productId", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product pr) {
        this.productService.deleteProductById(pr.getProductId());
        return "redirect:/admin/product";
    }

    // cập nhật sản phẩms
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Optional<Product> currentProduct = this.productService.fetchProductById(id);
        if (currentProduct.isPresent()) {
            model.addAttribute("newProduct", currentProduct.get());
            return "admin/product/update";
        } else {
            // Handle the case where the product is not found
            model.addAttribute("error", "Product not found");
            return "admin/product/error";
        }
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProduct(@ModelAttribute("newProduct") @Valid Product pr,
            BindingResult newProductBindingResult,
            @RequestParam("productImage") MultipartFile file) {

        // validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }

        Product currentProduct = this.productService.fetchProductById(pr.getProductId()).get();
        if (currentProduct != null) {
            // update new image
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }

            currentProduct.setProductName(pr.getProductName());
            currentProduct.setPrice(pr.getPrice());
            currentProduct.setQuantity(pr.getQuantity());
            currentProduct.setDetailDesc(pr.getDetailDesc());
            currentProduct.setShortDesc(pr.getShortDesc());
            currentProduct.setFactory(pr.getFactory());
            currentProduct.setTarget(pr.getTarget());

            this.productService.createProduct(currentProduct);
        }
        
        return "redirect:/admin/product";
    }
    /*
     * @PostMapping("/admin/product/update")
     * public String postUpdateProduct(@ModelAttribute("newProduct") Product pr,
     * BindingResult newProductBindingResult,
     * 
     * @RequestParam("productImage") MultipartFile productFile,
     * Model model) {
     * 
     * // Kiểm tra lỗi xác thực
     * if (newProductBindingResult.hasErrors()) {
     * // Nếu có lỗi, trả về trang cập nhật với thông tin sản phẩm hiện tại
     * // model.addAttribute("newProduct", pr); // Đảm bảo rằng thông tin sản phẩm
     * được
     * // giữ lại
     * return "admin/product/update"; // Trả về trang cập nhật
     * }
     * 
     * // Tìm sản phẩm theo ID
     * Optional<Product> optionalProduct =
     * this.productService.fetchProductById(pr.getProductId());
     * if (optionalProduct.isEmpty()) {
     * model.addAttribute("error", "Product not found");
     * return "admin/error";
     * }
     * 
     * Product currentProduct = optionalProduct.get();
     * if (currentProduct != null) {
     * System.out.println("currentProduct: " + currentProduct);
     * // Cập nhật thông tin sản phẩm
     * if (!productFile.isEmpty()) {
     * String imgProduct = this.uploadService.handleSaveUploadFile(productFile,
     * "product");
     * currentProduct.setImage(imgProduct);
     * }
     * 
     * // Cập nhật các trường khác
     * currentProduct.setProductName(pr.getProductName());
     * currentProduct.setPrice(pr.getPrice());
     * currentProduct.setQuantity(pr.getQuantity());
     * currentProduct.setDetailDesc(pr.getDetailDesc());
     * currentProduct.setShortDesc(pr.getShortDesc());
     * currentProduct.setFactory(pr.getFactory());
     * currentProduct.setTarget(pr.getTarget());
     * 
     * // Lưu sản phẩm
     * this.productService.createProduct(currentProduct);
     * }
     * 
     * return "redirect:/admin/product";
     * }
     */

}