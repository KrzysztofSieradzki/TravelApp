package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.travelApp.application.dto.CountryDTO;
import pl.com.travelApp.application.dto.LogggedUserDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.enums.Countries;
import pl.com.travelApp.application.model.enums.Status;
import pl.com.travelApp.application.service.CountryService;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/country")
public class CountryController {

    private final CountryService countryService;
    private final TripService tripService;
    private final UserService userService;

    public CountryController(CountryService countryService, TripService tripService, UserService userService) {
        this.countryService = countryService;
        this.tripService = tripService;
        this.userService = userService;
    }

    @ModelAttribute(name="countries")
    public List<Countries> countries()
    {return new ArrayList<>(Arrays.asList(Countries.values()));
    }



    @GetMapping()
    public String showInfoAboutCountry(@RequestParam(required = false, defaultValue = "DOMESTIC") String id_country, Model model, Principal principal){
        Optional<CountryDTO> countryDTO = countryService.infoAboutCountry(id_country);
        model.addAttribute("infoAboutCountry",countryDTO.get());

        LogggedUserDTO userDTO = userService.getUser(principal.getName());
        List<TripDTO> visited = tripService.findAllByStatus(userDTO.getId(),Status.VISITED);
        List<TripDTO> toVisit = tripService.findAllByStatus(userDTO.getId(),Status.TO_VISIT);

        String check = "";
        for(TripDTO v: visited){
            if(v.getId_country().toString().equals(id_country.toUpperCase())){
                check="visited";
            }
        }
        for(TripDTO tv: toVisit){
            if(tv.getId_country().toString().equals(id_country.toUpperCase())){
                check="tovisit";
            }
        }

        model.addAttribute("checkedTrip",check);
        return "country-info";
    }



}
