package start.spring.io.spring1.service;

import org.springframework.stereotype.Service;

@Service
public class UserService {
    public String handelHello(){
        return "hello from service";
    }
}
