package pl.com.travelApp.application.model.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.travelApp.application.model.entities.Country;

import java.util.List;
import java.util.Optional;


public interface CountryRepository extends JpaRepository<Country,Long> {

    Optional<Country> findCountryByCountryCode(String country_code);
}
