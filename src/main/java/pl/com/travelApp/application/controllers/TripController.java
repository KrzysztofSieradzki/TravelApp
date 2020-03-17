package pl.com.travelApp.application.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.repositories.TripRepository;
import pl.com.travelApp.application.model.repositories.UserRepository;

import java.security.Principal;

@Controller
public class TripController {

    private final UserRepository userRepository;
    private final TripRepository tripRepository;

    @Autowired
    public TripController(UserRepository userRepository, TripRepository tripRepository) {
        this.userRepository = userRepository;
        this.tripRepository = tripRepository;
    }

    @PostMapping("/add-trip")
    public String addTrip(String target, Integer year, Principal principal){
        Trip trip = new Trip();
        String username= principal.getName();
        User user = userRepository.findByUsername(username);
        trip.setUser(user);
        trip.setTarget(target);
        trip.setYear(year);

        tripRepository.save(trip);

        return"redirect:/";
    }
}
