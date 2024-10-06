package start.spring.io.spring1.service;

import org.springframework.stereotype.Service;

import start.spring.io.spring1.domain.User;
import start.spring.io.spring1.repository.UserRepository;

@Service
public class UserService {
    // DI: dependency injection
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handelHello() {
        return "hello from service";
    }

    public User handleSaveUser(User user) {
        User nguoiDung = this.userRepository.save(user);
        System.out.println("nguoi dung da duoc luu: " + nguoiDung);
        return nguoiDung;
    }
}
