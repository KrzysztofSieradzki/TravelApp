package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.travelApp.application.dto.EquipmentDTO;
import pl.com.travelApp.application.dto.TransportDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.enums.*;
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

    @ModelAttribute(name="devices")
    public List<Devices> devices(){ return new ArrayList<>(Arrays.asList(Devices.values()));}

    @ModelAttribute(name="clothes")
    public List<Clothes> clothes(){ return new ArrayList<>(Arrays.asList(Clothes.values()));}

    @ModelAttribute(name="documents")
    public List<Documents> documents(){
        return new ArrayList<>(Arrays.asList(Documents.values()));
    }

    @ModelAttribute(name="other")
    public List<Other> others(){
        return new ArrayList<>(Arrays.asList(Other.values()));
    }

    @ModelAttribute("category_device")
    public Categories categoryDevice(){return Categories.DEVICES;}
    @ModelAttribute("category_cloth")
    public Categories categoryCLoth(){return Categories.SPECIAL_CLOTHES;}
    @ModelAttribute("category_document")
    public Categories categoryDocument(){return Categories.DOCUMENTS;}
    @ModelAttribute("category_other")
    public Categories categoryOther(){return Categories.OTHER;}

    @GetMapping
    public String getPage(@RequestParam(required = false) Long tripIdNumber, Model model, Principal principal){
        TripDTO tripDTO;
        if(tripIdNumber!=null){
            if(tripIdNumber==-1){
                return "organizer-page";
            }
        tripDTO = tripService.findTripById(tripIdNumber, principal);
        model.addAttribute("myTrip",tripDTO);
            List<TransportDTO> transportDTO = organizerService.allAddedTransport(tripDTO.getId());
            List<EquipmentDTO> devices = organizerService.allAddedEquipmentsByCategory(tripDTO.getId(),Categories.DEVICES);
            List<EquipmentDTO> documents = organizerService.allAddedEquipmentsByCategory(tripDTO.getId(),Categories.DOCUMENTS);
            List<EquipmentDTO> clothes = organizerService.allAddedEquipmentsByCategory(tripDTO.getId(),Categories.SPECIAL_CLOTHES);
            List<EquipmentDTO> other = organizerService.allAddedEquipmentsByCategory(tripDTO.getId(),Categories.OTHER);
            if(!devices.isEmpty()){ model.addAttribute("addedDevices",devices); }
            if(!documents.isEmpty()){ model.addAttribute("addedDocuments",documents); }
            if(!clothes.isEmpty()){ model.addAttribute("addedClothes",clothes); }
            if(!other.isEmpty()){ model.addAttribute("addedOther",other); }

            if(transportDTO.size()>0){
            model.addAttribute("addedTransports",transportDTO);}

        }

        return "organizer-page";
    }
    @PostMapping("/addTransport")
    public String addTransport(Transports transports,Long tripId,Principal principal){
        if(tripId==null|| tripId==-1){
            return "organizer-page";
        }
        organizerService.addTransport(transports,tripId,principal);
        return "redirect:/organizer?tripIdNumber="+tripId;
    }

    @PostMapping("/cost")
    public String setUpCost(Double cost, Long idTransport, Long tripId){
        if(tripId==null|| tripId==-1){
            return "organizer-page";
        }
        organizerService.setUpCost(idTransport,cost);
        return "redirect:/organizer?tripIdNumber="+tripId;
    }

    @PostMapping("/addEquipment")
    public String addDevice(String name, Long tripId,Categories category,Principal principal){
        if(tripId==null|| tripId==-1){
            return "organizer-page";
        }
        organizerService.addEquipment(name,tripId,category,principal);
        return "redirect:/organizer?tripIdNumber="+tripId;
    }

    @PostMapping("/addDetails")
    public String addDetails(String description,Integer quantity, Boolean active, Long tripId, Long idEquipment){
        if(tripId==null|| tripId==-1){
            return "organizer-page";
        }
        organizerService.setUpDetails(idEquipment,quantity,description,active);
        return "redirect:/organizer?tripIdNumber="+tripId;
    }



}
