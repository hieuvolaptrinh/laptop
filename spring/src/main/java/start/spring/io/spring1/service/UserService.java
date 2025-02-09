package start.spring.io.spring1.service;

import java.lang.String;
import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import start.spring.io.spring1.domain.Role;
import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.domain.DTO.RegisterDTO;
import start.spring.io.spring1.repository.RoleRepository;
import start.spring.io.spring1.repository.UserRepository;

@Service
public class UserService {
    // DI: dependency injection
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder; // mã hóa mật khẩu hash password

    public UserService(UserRepository userRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public long countUser() {
        return this.userRepository.count();
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User nguoiDung = this.userRepository.save(user);
        System.out.println("nguoi dung da duoc luu: " + nguoiDung);
        return nguoiDung;
    }

    // lấy ra user

    public Optional<User> getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    //
    public Role getRoleByName(String name) {
        return this.roleRepository.findByRoleName(name);
    }

    // DTO : data transfer object
    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;

    }

    // hàm kiểm tra email đã tồn tại trong database chưa ?
    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    // lấy người dùng theo email
    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
