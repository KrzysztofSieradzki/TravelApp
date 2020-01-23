package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.travelApp.application.model.domestics.Trip;

import java.util.List;

public interface TripRepository extends JpaRepository<Trip,Long> {

    List<Trip> findAllByOrderByYear();

}
