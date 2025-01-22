package start.spring.io.spring1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.authentication.dao.DaoAuthenticationProvider;

import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.DispatcherType;
import start.spring.io.spring1.service.CustomerUserDetailsService;
import start.spring.io.spring1.service.UserService;

@Configuration
@EnableWebSecurity // HttpSecurity http mới hoạt động được vì phiên bản mới
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

    // cho phép sử dụng tài khoản và mật khẩu được lưu trữ trong cơ sở dữ liệu
    // (CSDL) để đăng nhập
    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }

    // để sử dụng cái giao diện login của mình thay vì của thằng spring
    // SecurityFilterChainConfiguration vào đó đọc sẽ thấy nó
    // anyRequest()).authenticated(); là phải xác thực hết, ở đây mình đang override
    // nó lại

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                DispatcherType.INCLUDE)
                        .permitAll()

                        .requestMatchers("/", "register", "/login", "/product/**", "/client/**", "/css/**", "/js/**",
                                "/images/**") // thêm cái này để nó không cần xác thực vì mình gọi nó sẽmatch qua ở
                        // controller=> nó sẽ chặn
                        .permitAll()

                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        .anyRequest().authenticated())
                // .anyRequest().permitAll())// anyRequest().authenticated()
                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .successHandler(cutomSuccessHandler())
                        .permitAll())
                .exceptionHandling(ex -> ex.accessDeniedPage("/access-denied"));// nếu không có quyền thì chuyển đến
        return http.build();
        // 117
    }

    @Bean
    public AuthenticationSuccessHandler cutomSuccessHandler() {
        return new CustomSuccessHandler();
    }

}
