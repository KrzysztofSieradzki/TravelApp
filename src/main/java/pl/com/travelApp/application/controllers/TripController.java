package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.dto.LogggedUserDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.enums.Countries;
import pl.com.travelApp.application.model.enums.Status;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/trip")
public class TripController {

    private final TripService tripService;
    private final UserService userService;

    public TripController(TripService tripService, UserService userService) {
        this.tripService = tripService;
        this.userService = userService;
    }

    @ModelAttribute(name="countries")
    public List<Countries> countries(){
        return new ArrayList<>(Arrays.asList(Countries.values()));
    }

    @ModelAttribute(name="status")
    public List<Status> status(){
        return new ArrayList<>(Arrays.asList(Status.values()));
    }

    @ModelAttribute(name="years")
    public List<Integer> years(){
        List<Integer> years= new ArrayList<>();
        for(int i=1930; i<2100; i++){
            years.add(i);
        }
        return years;
    }

    @GetMapping
    public String showTrip(Model model, Principal principal){
        LogggedUserDTO userDTO = userService.getUser(principal.getName());
        List<TripDTO> visited = tripService.findAllByStatus(userDTO.getId(),Status.VISITED);
        List<TripDTO> toVisit = tripService.findAllByStatus(userDTO.getId(),Status.TO_VISIT);
        model.addAttribute("visited",visited);
        model.addAttribute("toVisit",toVisit);
        return "trip-page";
    }

    @PostMapping("/add-trip")
    public String addTrip(TripDTO tripDTO, Principal principal){
        tripService.addNewTrip(tripDTO, principal);

        return"redirect:/trip";
    }

    @GetMapping("/delete")
    public String deleteTrip(Long tripId, Principal principal){
        tripService.deleteTrip(tripId, principal);
        return "redirect:/trip";
    }

    @GetMapping("/uncheck")
    public String uncheckTrip(Long tripId, Principal principal){

        tripService.uncheckTrip(tripId,userService.getUser(principal.getName()).getId());
        return"redirect:/trip";
    }

}
