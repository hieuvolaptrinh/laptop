package start.spring.io.spring1.controller;

import java.util.List;

import org.springframework.stereotype.Controller;

import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.repository.UserRepository;
import start.spring.io.spring1.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.ui.Model;

@Controller
public class UserController {
    // DI: dependency injection
    private final UserService userService;

    public UserController(UserService userService, UserRepository userRepository) {
        this.userService = userService;

    }

    @RequestMapping("/") // mặt định nó là method GET
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("vndhieuak@gmail.com");
        System.out.println("arUsers: " + arrUsers);
        model.addAttribute("bien", "in ra biến");
        return "hello";
    }

    // list user
    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("usersArray", users);// truyền dữ liệu từ controller sang view
        return "/admin/user/table-user";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }

    // @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)//
    // cả 2 cách đều oke
    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") User userHieuVo) {
        // lấy newUser từ form, Kiểu dữ liệu phải trùng với kiểu dữ liệu của biến
        this.userService.handleSaveUser(userHieuVo); // lưu người dùng truyền vào
        return "redirect:/admin/user"; // chuyển hướng ngược lại phần requestmapping ở trên /admin/user
        // redirect: chuyển hướng ngược lại ko bị lỗi
    }
}
