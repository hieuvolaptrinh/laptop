package start.spring.io.spring1;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class helloController {
    @GetMapping("/")
    public String index() {
        return "Hello sadâsadád thay đổi  ";
    }

    @GetMapping("/user")
    public String userPage() {
        return "ony user can see this page";
    }
    @GetMapping("/admin")
    public String adminPage() {
        return "Only admin can see access this page";
    }
    
    
    // C:\Program Files\Java\jdk-22

}