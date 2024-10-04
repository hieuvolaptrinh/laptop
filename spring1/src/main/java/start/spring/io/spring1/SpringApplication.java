package start.spring.io.spring1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

// @SpringBootApplication
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class) // disable
                                                                                                                          // security

public class Spring1Application {

    public static void main(String[] args) {
        // container
        ApplicationContext hieuvo = SpringApplication.run(Spring1Application.class, args);
        // for(String name: hieuvo.getBeanDefinitionNames()) {
        // System.out.println(name);
        // }
        System.out.println(hieuvo.getBeanDefinitionCount());

    }
}
