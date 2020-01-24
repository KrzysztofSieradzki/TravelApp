package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.travelApp.application.model.domestics.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);
}
