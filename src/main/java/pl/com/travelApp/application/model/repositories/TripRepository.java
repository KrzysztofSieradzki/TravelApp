package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;

import java.util.List;
import java.util.Optional;

public interface TripRepository extends JpaRepository<Trip,Long> {

    List<Trip> findAllByUserId(Long id);

    Optional<Trip> findById(Long tripId);
}
