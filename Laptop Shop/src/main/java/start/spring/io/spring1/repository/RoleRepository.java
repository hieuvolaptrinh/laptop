package start.spring.io.spring1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import start.spring.io.spring1.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByRoleName(String roleName); // phải để roleName trùng voi tên cột trong table Role

}
