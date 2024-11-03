package start.spring.io.spring1.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
public class ItemController {

    @GetMapping("/product/{id}")
    public String getDetailProduct(Model model, @PathVariable Long id) {
        return "client/product/detail";
    }

}