package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.model.entities.Country;
import pl.com.travelApp.application.model.enums.Countries;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/country")
public class CountryController {

    @GetMapping
    public String showPage(){
        return "country-info";
    }

    @ModelAttribute(name="countries")
    public List<Countries> countries()
    {return new ArrayList<>(Arrays.asList(Countries.values()));
    }



}
