package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUsername(String username);
    @Query(value = "SELECT t FROM User u JOIN u.trips t WHERE u.id= ?1")
    List<Trip> findAllTrips(Long id);
}
