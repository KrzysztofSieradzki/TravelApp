package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.service.TripService;

import java.security.Principal;

@Controller
public class TripController {

   private final TripService tripService;

    public TripController(TripService tripService) {
        this.tripService = tripService;
    }


    @PostMapping("/add-trip")
    public String addTrip(TripDTO tripDTO, Principal principal){
        tripService.addNewTrip(tripDTO, principal);

        return"redirect:/";
    }
}
