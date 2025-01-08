package start.spring.io.spring1.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import start.spring.io.spring1.domain.Product;
import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.domain.DTO.RegisterDTO;
import start.spring.io.spring1.service.ProductService;
import start.spring.io.spring1.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder; // mã hóa mật khẩu hash password

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {
        List<Product> products = this.productService.fetchProducts();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    // trang đăng kí người dùng
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO// sử dụng valid để kiểm
                                                                                               // tra vì minh đã tạo
                                                                                               // annotation
                                                                                               // @RegisterChecked
            , BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword()); // mã hóa mật khẩu
        user.setPassword(hashPassword); // set mật khẩu đã mã hóa
        user.setRole(this.userService.getRoleByName("USER"));
        // save
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    //
    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

}
