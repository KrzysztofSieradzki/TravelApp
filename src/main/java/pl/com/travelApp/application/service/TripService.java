package pl.com.travelApp.application.service;

import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.enums.Status;
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
                .id_country(tripDTO.getId_country())
                .name(tripDTO.getId_country().getCountry())
                .status(tripDTO.getStatus())
                .year(tripDTO.getYear())
                .user(user.get())
                .build();
        tripRepository.save(trip);

    }


    public List<TripDTO> findAllTrips(Long id) {
        return tripRepository.findAllByUserId(id).stream().map(trip->{
            TripDTO tripDTO = new TripDTO();
            tripDTO.setId(trip.getId());
            tripDTO.setId_country(trip.getId_country());
            tripDTO.setStatus(trip.getStatus());
            tripDTO.setYear(trip.getYear());
            tripDTO.setUser(trip.getUser());
            return tripDTO;
        }).collect(Collectors.toList());
    }

    public List<TripDTO> findAllByStatus(Long id, Status status){
        return tripRepository.findAllByUserId(id).stream()
                .map(trip->{
                    TripDTO tripDTO = new TripDTO();
                    tripDTO.setId(trip.getId());
                    tripDTO.setId_country(trip.getId_country());
                    tripDTO.setStatus(trip.getStatus());
                    tripDTO.setUser(trip.getUser());
                    tripDTO.setYear(trip.getYear());
                    return tripDTO;
                })
                .filter(tripDTO -> tripDTO.getStatus()==status).collect(Collectors.toList());
    }

    public void deleteTrip(Long id, Principal principal){
        Optional<User> user = userRepository.findByUsername(principal.getName());
        if(user.isPresent()){
        Optional<Trip> trip = tripRepository.findById(id);
        trip.ifPresent(tripRepository::delete);
        }
    }

    public void uncheckTrip(Long tripId, Long userId) {
        List<Trip> trips = userRepository.findAllTrips(userId).stream()
                .filter(trip->
                        trip.getId().equals(tripId)
                ).collect(Collectors.toList());
        for(Trip t : trips){
            t.setStatus(Status.VISITED);
            tripRepository.save(t);
        }
    }

}
