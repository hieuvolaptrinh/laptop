package start.spring.io.spring1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class ScurityConfiguration { // Chỉnh sửa tên lớp ở đây

    // @Bean
    // public UserDetailsService userDetailsService() {
    // InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
    // manager.createUser(User.withUsername("hieuvo")
    // .password(passwordEncoder().encode("hieuvo123"))
    // .roles("USER")
    // .build());
    // return manager;
    // }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
