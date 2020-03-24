package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.travelApp.application.model.entities.Country;


public interface CountryRepository extends JpaRepository<Country,Long> {

}
