package start.spring.io.spring1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import start.spring.io.spring1.domain.User;
import java.util.List;
import java.util.Optional;

//CRUD: Create, Read, Update, Delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    List<User> findOneByEmail(String email);

    User findFirstByEmail(String email);

    Optional<User> findById(long id);

    void deleteById(long id);

    // kiểm tra email đã tồn tại chưa
    boolean existsByEmail(String email); // existsBy + fieldName

    // tìm kiếm người dùng dựa vào email <cái email là duy nhất>
    User findByEmail(String email);
}
