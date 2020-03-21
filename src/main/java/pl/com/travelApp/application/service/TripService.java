package pl.com.travelApp.application.service;

import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.repositories.TripRepository;
import pl.com.travelApp.application.model.repositories.UserRepository;

import java.security.Principal;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TripService {

    private final TripRepository tripRepository;
    private final UserRepository userRepository;

    public TripService(TripRepository tripRepository, UserRepository userRepository) {
        this.tripRepository = tripRepository;
        this.userRepository = userRepository;
    }

    public void addNewTrip(TripDTO tripDTO, Principal principal){

        Optional<User> user = userRepository.findByUsername(principal.getName());

        Trip trip = Trip.builder()
                .target(tripDTO.getTarget())
                .year(tripDTO.getYear())
                .user(user.get())
                .build();
        tripRepository.save(trip);

    }


    public List<TripDTO> findAllByUserId(Long id) {
        return tripRepository.findAllByUserId(id).stream().map(trip->{
            TripDTO tripDTO = new TripDTO();
            tripDTO.setTarget(trip.getTarget());
            tripDTO.setYear(trip.getYear());
            tripDTO.setUser(trip.getUser());
            return tripDTO;
        }).collect(Collectors.toList());
    }


}
