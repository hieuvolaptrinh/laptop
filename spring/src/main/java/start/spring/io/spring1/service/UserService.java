package start.spring.io.spring1.service;

import java.lang.String;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import start.spring.io.spring1.domain.Role;
import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.repository.RoleRepository;
import start.spring.io.spring1.repository.UserRepository;

@Service
public class UserService {
    // DI: dependency injection
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    // public String handelHello() {
    // return "hello from service";
    // }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
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
}
