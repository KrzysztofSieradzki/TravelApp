package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.travelApp.application.model.entities.Transport;


public interface TransportRepository extends JpaRepository<Transport,Long> {

}
