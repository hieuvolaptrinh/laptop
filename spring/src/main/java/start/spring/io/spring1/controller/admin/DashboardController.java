package start.spring.io.spring1.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import start.spring.io.spring1.repository.ProductRepository;
import start.spring.io.spring1.service.OrderService;
import start.spring.io.spring1.service.ProductService;
import start.spring.io.spring1.service.UserService;

@Controller
public class DashboardController {

    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;

    public DashboardController(ProductService productService, UserService userService,
            OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("cuontUser", this.userService.countUser());
        model.addAttribute("countProduct", this.productService.countProduct());
        model.addAttribute("countOrder", this.orderService.countOrder());
        return "admin/dashboard/show";
    }
}
