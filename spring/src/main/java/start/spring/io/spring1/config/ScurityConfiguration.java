package start.spring.io.spring1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;

import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.security.crypto.password.PasswordEncoder;

import start.spring.io.spring1.service.CustomerUserDetailsService;
import start.spring.io.spring1.service.UserService;

@Configuration
@EnableWebSecurity // HttpSecurity http mới hoạt động được vì phiên bản mới mình méo biết chỉnh
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
        // return NoOpPasswordEncoder.getInstance(); // tạm thời tắt mã hóa mật khẩu
        return new BCryptPasswordEncoder();
    }

    // viết lại để nói với thằng spring mình sẽ đăng nhập spiring scurity
    // bằng cách sẽ lấy userName và password từ database chứ không phải mặt định
    // mình
    // config nữa
    @Bean
    public UserDetailsService userDetailsService(UserService userService) { // ghi đè lại cái userDetailService của
                                                                            // thằng spring bằng
                                                                            // CustomerUserDetailsService mà mình tạo ra
                                                                            // còn cái đối số truyền vào là userService
                                                                            // là vì CustomerUserDetailsService mình tạo
                                                                            // code dependecy injection mình truyền vào
                                                                            // luôn
        return new CustomerUserDetailsService(userService);
    }

    @Bean
    public AuthenticationManager authenticationManager(HttpSecurity http,
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) throws Exception {
        AuthenticationManagerBuilder authenticationManagerBuilder = http
                .getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder);
        return authenticationManagerBuilder.build();
    }
}
