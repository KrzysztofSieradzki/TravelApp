package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;

import java.util.List;
import java.util.Optional;

public interface TripRepository extends JpaRepository<Trip,Long> {

    List<Trip> findAllByUserId(Long id);

    Optional<Trip> findById(Long tripId);
    @Query(value="SELECT t FROM User u JOIN u.trips t WHERE t.id =?1 AND u.id=?2")
    Optional<Trip> findByIdAndUserId(Long tripId, Long userId);
}
