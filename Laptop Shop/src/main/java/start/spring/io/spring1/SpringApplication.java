package start.spring.io.spring1;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

// @SpringBootApplication
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
// disable
// security
public class SpringApplication {
    public static void main(String[] args) {
        ApplicationContext hieuvo = org.springframework.boot.SpringApplication.run(SpringApplication.class, args);

    }
}
