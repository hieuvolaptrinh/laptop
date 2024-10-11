package start.spring.io.spring1.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.repository.UserRepository;
import start.spring.io.spring1.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

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

    // create new user
    // @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") User userHieuVo) {
        // lấy newUser từ form, Kiểu dữ liệu phải trùng với kiểu dữ liệu của biến
        this.userService.handleSaveUser(userHieuVo); // lưu người dùng truyền vào
        return "redirect:/admin/user"; // chuyển hướng ngược lại phần requestmapping ở trên /admin/user
        // redirect: chuyển hướng ngược lại ko bị lỗi
    }

    // render list user
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

    // show user detail
    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("check path id " + id); // lấy ra được động id rồi
        model.addAttribute("idUser", id);
        // Lấy thông tin user
        Optional<User> userOptional = this.userService.getUserById(id);
        // Kiểm tra xem user có tồn tại không
        if (userOptional.isPresent()) {
            model.addAttribute("user", userOptional.get()); // phải có .get() để lấy ra user
        } else {
            // Xử lý khi không tìm thấy user
            model.addAttribute("errorMessage", "User not found");
            return "error";
        }
        return "/admin/user/show";
    }

    // update user
    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        Optional<User> currentUser = this.userService.getUserById(id);
        model.addAttribute("user", currentUser);
        return "/admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("user") User user) {
        Optional<User> currentUser = this.userService.getUserById(user.getId());
        System.out.println("check user trước: " + user);
        if (currentUser != null) {
            // currentUser.setFullName(user.getFullName()); // vì mình sử dụng Optional
            // .get() để trả về giá trị bên trong nó
            currentUser.get().setFullName(user.getFullName());
            currentUser.get().setAddress(user.getAddress());
            currentUser.get().setPhone(user.getPhone());
            System.out.println("check user sau : " + currentUser);
            this.userService.handleSaveUser(currentUser.get()); // lưu người dùng truyền vào database

        } else {
            System.out.println("User not found");
            return "error";
        }
        return "redirect:/admin/user";
    }

    // delete user
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id); // để lấy đươc user có id mình lấy ở path
        // model.addAttribute("newUser", user);
        model.addAttribute("newUser", new User());
        return "/admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User hieuVo) {
        System.out.println("check user " + hieuVo);
        this.userService.deleteUserById(hieuVo.getId());
        return "redirect:/admin/user";
    }
}
