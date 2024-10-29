package start.spring.io.spring1.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomePageController {
    
    @GetMapping("/homePage")
    public String getMethodName(@RequestParam String param) {
        return new String();
    }
    
}
