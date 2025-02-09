package start.spring.io.spring1.repository;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import start.spring.io.spring1.domain.Order;
import start.spring.io.spring1.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);
}
