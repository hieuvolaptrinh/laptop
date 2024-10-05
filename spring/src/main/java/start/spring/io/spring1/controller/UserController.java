package start.spring.io.spring1.controller;

import org.springframework.stereotype.Controller;

import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.ui.Model;

@Controller
public class UserController {
    // DI: dependency injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/") // mặt định nó là method GET
    public String getHomePage(Model model) {
        String test = this.userService.handelHello();
        model.addAttribute("bien", test);
        return "hello";
    }

    @RequestMapping(value = "/admin/user/", method = RequestMethod.GET)
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }

    // @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)//
    // cả 2 cách đều oke
    @PostMapping("/admin/user/create1")
    public String createUserLogin(Model model,@ModelAttribute("newUser") User userHieuVo) { 
        // lấy newUser từ form, Kiểu dữ liệu phải trùng với kiểu dữ liệu của biến newUser
       System.out.println("run here" + userHieuVo.toString());
        return "hello";
    }
}
