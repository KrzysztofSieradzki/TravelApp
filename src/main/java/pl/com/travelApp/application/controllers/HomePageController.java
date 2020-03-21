package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.enums.Status;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomePageController {

    private final UserService userService;
    private final TripService tripService;

    public HomePageController(UserService userService, TripService tripService) {
        this.userService = userService;
        this.tripService = tripService;
    }

    @ModelAttribute(name="visitedCountries")
    public List<TripDTO> visitedTrips(Principal principal){
        return userService.findAllTripsByStatus(userService.getUser(principal.getName()).getId(), Status.VISITED);
    }

    @ModelAttribute(name="toVisitCountries")
    public List<TripDTO> toVisitTrips(Principal principal){
        return userService.findAllTripsByStatus(userService.getUser(principal.getName()).getId(), Status.TO_VISIT);
    }

    @GetMapping
    public String prepareHomePage(){
        return "home-page";
    }



}
