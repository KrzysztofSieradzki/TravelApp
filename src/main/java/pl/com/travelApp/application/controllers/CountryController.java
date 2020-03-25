package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.travelApp.application.dto.CountryDTO;
import pl.com.travelApp.application.model.enums.Countries;
import pl.com.travelApp.application.service.CountryService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/country")
public class CountryController {

    private final CountryService countryService;

    public CountryController(CountryService countryService) {
        this.countryService = countryService;
    }

    @ModelAttribute(name="countries")
    public List<Countries> countries()
    {return new ArrayList<>(Arrays.asList(Countries.values()));
    }

//    @GetMapping()
//    public String showPage(){
//        return "country-info";
//    }



    @GetMapping()
    public String showInfoAboutCountry(@RequestParam(required = false, defaultValue = "DOMESTIC") String id_country, Model model){
        Optional<CountryDTO> countryDTO = countryService.infoAboutCountry(id_country);
//        if(countryDTO.isPresent()){
        model.addAttribute("infoAboutCountry",countryDTO.get());
        return "country-info";
//        }
//
//            return "country-info";
    }


}
