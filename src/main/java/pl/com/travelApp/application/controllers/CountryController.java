package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/country")
public class CountryController {

    @GetMapping
    public String showPage(){
        return "country-info";
    }



}
