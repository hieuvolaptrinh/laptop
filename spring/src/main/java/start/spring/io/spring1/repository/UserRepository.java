package start.spring.io.spring1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import start.spring.io.spring1.domain.User;
import java.util.List;

//CRUD: Create, Read, Update, Delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    List<User> findByEmail(String email);

    User findFirstByEmail(String email);

}
