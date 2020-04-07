package pl.com.travelApp.application.service;


import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.EquipmentDTO;
import pl.com.travelApp.application.dto.TransportDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.entities.Equipment;
import pl.com.travelApp.application.model.entities.Transport;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.enums.Categories;
import pl.com.travelApp.application.model.enums.Devices;
import pl.com.travelApp.application.model.enums.Transports;
import pl.com.travelApp.application.model.repositories.EquipmentRepository;
import pl.com.travelApp.application.model.repositories.TransportRepository;
import pl.com.travelApp.application.model.repositories.TripRepository;
import pl.com.travelApp.application.model.repositories.UserRepository;

import java.security.Principal;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrganizerService {

    private final EquipmentRepository equipmentRepository;
    private final TransportRepository transportRepository;
    private final UserRepository userRepository;
    private final TripRepository tripRepository;

    public OrganizerService(EquipmentRepository equipmentRepository, TransportRepository transportRepository, UserRepository userRepository, TripRepository tripRepository) {
        this.equipmentRepository = equipmentRepository;
        this.transportRepository = transportRepository;
        this.userRepository = userRepository;
        this.tripRepository = tripRepository;
    }

    public void addTransport(Transports transports, Long idTrip, Principal principal){
        Optional<User> user = userRepository.findByUsername(principal.getName());
        Optional<Trip> trip = tripRepository.findByIdAndUserId(idTrip,user.get().getId());

        Transport transport = Transport.builder()
                .trip(trip.get())
                .transports(transports).build();
        transportRepository.save(transport);
    }

    public void addEquipment(String name, Long idTrip, Categories category, Principal principal){
        Optional<User> user = userRepository.findByUsername(principal.getName());
        Optional<Trip> trip = tripRepository.findByIdAndUserId(idTrip,user.get().getId());

        Equipment equipment = Equipment.builder()
                .categories(category)
                .name(name)
                .trip(trip.get())
                .build();
        equipmentRepository.save(equipment);
    }

    public List<TransportDTO> allAddedTransport(Long idTrip) {
        return transportRepository.findAllByTripId(idTrip).stream()
                .map(transport->{
            TransportDTO transportDTO = new TransportDTO();
            transportDTO.setId(transport.getId());
            transportDTO.setTransports(transport.getTransports());
            transportDTO.setCost(transport.getCost());
            transportDTO.setTrip(transport.getTrip());
            return transportDTO;
        }).collect(Collectors.toList());
    }

    public List<EquipmentDTO> allAddedEquipmentsByCategory(Long idTrip,Categories categories){
        return equipmentRepository.findAllByTripId(idTrip).stream()
                .map(equipment -> {
                    EquipmentDTO equipmentDTO = new EquipmentDTO();
                    equipmentDTO.setId(equipment.getId());
                    equipmentDTO.setCategories(equipment.getCategories());
                    equipmentDTO.setActive(equipment.getActive());
                    equipmentDTO.setDescription(equipment.getDescription());
                    equipmentDTO.setName(equipment.getName());
                    equipmentDTO.setTrip(equipment.getTrip());
                    equipmentDTO.setQuantity(equipment.getQuantity());
                    return equipmentDTO;
                }).filter(equipmentDTO -> equipmentDTO.getCategories().equals(categories)).collect(Collectors.toList());
    }

    public void setUpCost(Long idTransport, Double cost){
        Transport transport = transportRepository.getOne(idTransport);
        transport.setCost(cost);
        transportRepository.save(transport);
    }

    public void setUpDetails(Long idEquipment, Integer quantity, String description, Boolean active){
        Equipment equipment = equipmentRepository.getOne(idEquipment);
        equipment.setActive(active);
        equipment.setDescription(description);
        equipment.setQuantity(quantity);
        equipmentRepository.save(equipment);
    }
}
