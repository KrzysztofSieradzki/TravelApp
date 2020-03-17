package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.dto.LogggedUserDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.entities.Trip;
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


    @GetMapping
    public String prepareHomePage(Model model, Principal principal){
        LogggedUserDTO userDTO = userService.getUser(principal.getName());
        List<TripDTO> allTrips = tripService.findAllByUserId(userDTO.getId());
        model.addAttribute("trips",allTrips);
        return "home-page";
    }



}
