package pl.com.travelApp.application.service;


import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.TransportDTO;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.entities.Transport;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.enums.Transports;
import pl.com.travelApp.application.model.repositories.EquipmentRepository;
import pl.com.travelApp.application.model.repositories.TransportRepository;
import pl.com.travelApp.application.model.repositories.TripRepository;
import pl.com.travelApp.application.model.repositories.UserRepository;

import java.security.Principal;
import java.util.Optional;

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
}
