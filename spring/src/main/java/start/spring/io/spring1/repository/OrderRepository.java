package start.spring.io.spring1.repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import start.spring.io.spring1.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}
