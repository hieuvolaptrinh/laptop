package start.spring.io.spring1.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import start.spring.io.spring1.domain.Cart;
import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.service.UserService;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;

    protected String determineTargetUrl(final Authentication authentication) {
        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        // get email (username)
        String email = authentication.getName();
        // query user by email
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("fullName", user.getFullName());// để vứt qua view
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("id", user.getId());
            Cart cartUser = user.getCart(); // lỗi vì chưa có cart nên phải check null

            if (cartUser != null) {
                long totalQuantity = cartUser.getTotalQuantity();
                // phải update lại totalQuantity trong session mỗi lần truyền qua view để cập
                // nhật số lượng ở bên service
                session.setAttribute("totalQuantity", totalQuantity);
            }
        }
    }

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    // Login success => đăng nhập hợp lệ=> lấy session ở đây sẽ oke
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {

            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request, authentication);

    }

}
