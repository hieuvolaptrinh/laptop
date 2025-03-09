package start.spring.io.spring1.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import start.spring.io.spring1.domain.User;

import start.spring.io.spring1.service.UploadService;
import start.spring.io.spring1.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import jakarta.validation.Valid;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;

    }

    @PostMapping("/create")
    public ResponseEntity<String> createUser(@RequestBody User newUser) {
        return ResponseEntity.ok("User created successfully: " + newUser.getFullName());
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("vndhieuak@gmail.com");
        System.out.println("arUsers: " + arrUsers);
        model.addAttribute("bien", "in ra biến");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam(name = "page") Optional<String> optionPage) {
        int page = 1;

        try {
            if (optionPage.isPresent()) {
                page = Integer.parseInt(optionPage.get());
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        Pageable pageable = PageRequest.of(page - 1, 1);
        Page<User> pageUsers = this.userService.getAllUsers(pageable);

        List<User> users = pageUsers.getContent();

        model.addAttribute("usersArray", users);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageUsers.getTotalPages());
        return "admin/user/show";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User userHieuVo,
            BindingResult newUserBindingResult,
            @RequestParam("hieuvoFile") MultipartFile file) {
        // bindingResult để kiểm tra lỗi + @Valid để kiểm tra dữ liệu
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println("error: " + error.getField() + " " + error.getDefaultMessage());
        }
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");

        String hashPassword = this.passwordEncoder.encode(userHieuVo.getPassword());
        userHieuVo.setPassword(hashPassword);
        userHieuVo.setAvatar(avatar);
        // còn phần Role mình lấy mối quan hệ 1:N từ Role sang User mà nó mình để là 1
        // đối tượng ở trong domain nên mình phải tạo ra 1 đối tượng Role mới để lưu vào
        // database trong RoleRepository
        userHieuVo.setRole(this.userService.getRoleByName(userHieuVo.getRole().getRoleName()));
        this.userService.handleSaveUser(userHieuVo);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // show user detail
    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("check path id " + id); // lấy ra được động id rồi
        model.addAttribute("idUser", id);

        Optional<User> userOptional = this.userService.getUserById(id);

        if (userOptional.isPresent()) {
            model.addAttribute("user", userOptional.get());
        } else {

            model.addAttribute("errorMessage", "User not found");
            return "error";
        }
        return "admin/user/detail";
    }

    // update user
    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        Optional<User> currentUserOptional = this.userService.getUserById(id);
        if (currentUserOptional.isPresent()) {
            User currentUser = currentUserOptional.get();
            model.addAttribute("user", currentUser);
        } else {

            return "error";
        }
        return "admin/user/update";
    }

    // update user
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("user") User user) {
        Optional<User> currentUser = this.userService.getUserById(user.getId());
        System.out.println("check user trước: " + user);
        if (currentUser != null) {
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

        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User hieuVo) {
        System.out.println("check user " + hieuVo);
        this.userService.deleteUserById(hieuVo.getId());
        return "redirect:/admin/user";
    }
}
