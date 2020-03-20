package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.dto.LogggedUserDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/trip")
public class TripController {

    private final TripService tripService;
    private final UserService userService;
    public TripController(TripService tripService, UserService userService) {
        this.tripService = tripService;
        this.userService = userService;
    }

    @GetMapping
    public String showTrip(Model model, Principal principal){
        LogggedUserDTO userDTO = userService.getUser(principal.getName());
        List<TripDTO> allTrips = tripService.findAllByUserId(userDTO.getId());
        model.addAttribute("trips",allTrips);
        return "";
    }

    @PostMapping("/add-trip")
    public String addTrip(TripDTO tripDTO, Principal principal){
        tripService.addNewTrip(tripDTO, principal);

        return"redirect:/trip";
    }
}
