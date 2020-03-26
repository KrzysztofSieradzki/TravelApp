package pl.com.travelApp.application.service;

import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.CountryDTO;
import pl.com.travelApp.application.model.entities.Country;
import pl.com.travelApp.application.model.repositories.CountryRepository;

import java.util.Optional;

@Service
public class CountryService {

    private final CountryRepository countryRepository;

    public CountryService(CountryRepository countryRepository) {
        this.countryRepository = countryRepository;
    }

    public Optional<CountryDTO> infoAboutCountry(String idCountry){
        Optional<Country> country = countryRepository.findCountryByCountryCode(idCountry);
        Optional<CountryDTO> countryDTO = Optional.of(new CountryDTO());
        countryDTO.get().setContinent(country.get().getContinent());
        countryDTO.get().setCountry_code(country.get().getCountryCode());
        countryDTO.get().setCurrency(country.get().getCurrency());
        countryDTO.get().setLanguage(country.get().getLanguage());
        countryDTO.get().setName(country.get().getName());
        countryDTO.get().setCapital(country.get().getCapital());
        countryDTO.get().setPoliticalSystem(country.get().getPoliticalSystem());
        countryDTO.get().setTimeZone(country.get().getTimeZone());
        countryDTO.get().setReligion(country.get().getReligion());
        return countryDTO;
    }
}
