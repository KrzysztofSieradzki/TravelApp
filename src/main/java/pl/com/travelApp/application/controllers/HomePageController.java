package pl.com.travelApp.application.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.model.domestics.Trip;
import pl.com.travelApp.application.model.repositories.TripRepository;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomePageController {

    private final TripRepository tripRepository;

    @Autowired
    public HomePageController(TripRepository tripRepository) {
        this.tripRepository = tripRepository;
    }

    @GetMapping
    public String prepareHomePage(Model model){
        List<Trip> allTrips = tripRepository.findAllByOrderByYear();
        model.addAttribute("trips",allTrips);

        return "/WEB-INF/views/home-page.jsp";
    }



}
