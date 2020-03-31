package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.dto.LogggedUserDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.enums.Status;
import pl.com.travelApp.application.service.CountryService;
import pl.com.travelApp.application.service.ExperienceService;
import pl.com.travelApp.application.service.TripService;
import pl.com.travelApp.application.service.UserService;

import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping("/profile")
public class ProfileController {


    private final ExperienceService experienceService;

    public ProfileController(ExperienceService experienceService) {
        this.experienceService = experienceService;
    }

    @GetMapping
    public String showProfile(Principal principal, Model model){
        String level = experienceService.yourCurrentLevel(principal);
        Integer numberOfVisitedCountries = experienceService.numberOfVisitedCountries(principal);
        Integer numberOfCountriesToVisit = experienceService.numberOfCountriesToVisit(principal);
        Double progress = experienceService.progressToGainNextLevel(principal);
        model.addAttribute("percentOfProgress",progress);
        model.addAttribute("visited",numberOfVisitedCountries);
        model.addAttribute("toVisit",numberOfCountriesToVisit);
        model.addAttribute("level",level);
        return "profile-page";
    }

    @ModelAttribute(name = "years")
    public List<Integer> years(Principal principal){
        return experienceService.historyVisitedByYears(principal);
    }


    @ModelAttribute(name="history")
    public Map<Integer,Integer> historyOfVisited(Principal principal){
        return experienceService.history(principal,Status.VISITED);
    }
    @ModelAttribute(name="predicted")
    public Map<Integer,Integer> predictedToVisit(Principal principal){
        return experienceService.history(principal,Status.TO_VISIT);
    }



}
