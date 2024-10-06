package start.spring.io.spring1.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import start.spring.io.spring1.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    User save(User user);

}
