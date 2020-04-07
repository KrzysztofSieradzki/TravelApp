package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.travelApp.application.model.entities.Equipment;

import java.util.List;


public interface EquipmentRepository extends JpaRepository<Equipment,Long> {

    List<Equipment> findAllByTripId(Long tripId);
}
