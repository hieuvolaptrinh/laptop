package start.spring.io.spring1;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloController {
    @GetMapping("/")
    public String index() {
        return "Hello, Spring oke! hiếu võ";
    }

    public static void main(String[] args) {
        System.out.println("Hello, Spring oke! hiếu võ");
    }
    // C:\Program Files\Java\jdk-22
}