package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.enums.Categories;
import pl.com.travelApp.application.model.enums.Transports;
import pl.com.travelApp.application.service.OrganizerService;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/organizer")
public class OrganizerController {

    private final OrganizerService organizerService;
    private final TripService tripService;
    private final UserService userService;


    public OrganizerController(OrganizerService organizerService, TripService tripService, UserService userService) {
        this.organizerService = organizerService;
        this.tripService = tripService;
        this.userService = userService;
    }

    @ModelAttribute(name = "trips")
    public List<TripDTO> tripDTO(Principal principal){
        return tripService.findAllTrips(userService.getUser(principal.getName()).getId());}

    @ModelAttribute(name="transports")
    public List<Transports> transports(){
        return new ArrayList<>(Arrays.asList(Transports.values()));
    }

    @ModelAttribute(name="categories")
    public List<Categories> categories(){
        return new ArrayList<>(Arrays.asList(Categories.values()));
    }


    @GetMapping
    public String getPage(
            @RequestParam(required = false, defaultValue = "DOMESTIC") TripDTO tripDTO, Model model){
                model.addAttribute("myTrip",tripDTO);

        return "organizer-page";
    }
    @PostMapping("/addTransport")
    public String addTransport(@RequestParam(required = false) Transports transports,
                               @RequestParam(required = false, defaultValue = "")Long tripId,
                               Principal principal){
        organizerService.addTransport(transports,tripId,principal);
        return "redirect:/organizer";
    }
}
