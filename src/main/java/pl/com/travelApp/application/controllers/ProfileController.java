package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.dto.LogggedUserDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.enums.Status;
import pl.com.travelApp.application.service.CountryService;
import pl.com.travelApp.application.service.ExperienceService;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final UserService userService;
    private final TripService tripService;
    private final CountryService countryService;
    private final ExperienceService experienceService;

    public ProfileController(UserService userService, TripService tripService, CountryService countryService, ExperienceService experienceService) {
        this.userService = userService;
        this.tripService = tripService;
        this.countryService = countryService;
        this.experienceService = experienceService;
    }

    @GetMapping
    public String showProfile(Principal principal, Model model){
        LogggedUserDTO userDTO = userService.getUser(principal.getName());
        List<TripDTO> visited = tripService.findAllByStatus(userDTO.getId(), Status.VISITED);
        List<TripDTO> toVisit = tripService.findAllByStatus(userDTO.getId(),Status.TO_VISIT);
        String level = experienceService.yourCurrentLevel(principal);

        model.addAttribute("visited",visited);
        model.addAttribute("toVisit",toVisit);
        model.addAttribute("level",level);
        return "profile-page";
    }


}
