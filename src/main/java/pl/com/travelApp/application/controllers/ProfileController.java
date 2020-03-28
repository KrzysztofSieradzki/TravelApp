package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.service.CountryService;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final UserService userService;
    private final TripService tripService;
    private final CountryService countryService;

    public ProfileController(UserService userService, TripService tripService, CountryService countryService) {
        this.userService = userService;
        this.tripService = tripService;
        this.countryService = countryService;
    }

    @GetMapping
    public String showProfile(){
        return "profile-page";
    }


}
