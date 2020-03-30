package pl.com.travelApp.application.service;

import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.TripDTO;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.enums.Levels;
import pl.com.travelApp.application.model.enums.Status;
import pl.com.travelApp.application.model.repositories.TripRepository;
import pl.com.travelApp.application.model.repositories.UserRepository;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Service
public class ExperienceService {

    private final UserRepository userRepository;
    private final TripService tripService;

    public ExperienceService(UserRepository userRepository, TripService tripService) {
        this.userRepository = userRepository;
        this.tripService = tripService;
    }

    public String yourCurrentLevel(Principal principal){
        Integer currentScore = numberOfVisitedCountries(principal);
        String output = yourLevel(currentScore).toString();
        if(output.contains("_")){
           String[] correctedOutput= output.split("_");
           output="";
           for(String s: correctedOutput){
               output+=s+" ";
           }
        }
        return output;
    }

    public Double progressToGainNextLevel(Principal principal){
        Integer currentScore = numberOfVisitedCountries(principal);
        Double currentLevel = (double)yourLevel(currentScore).getLevel();
        Double nextLevel = (double)nextLevel(currentScore).getLevel();
        Double percentOfProgress= ((currentScore-currentLevel)*100)/(nextLevel-currentLevel);

        return percentOfProgress;
    }

    public Levels yourLevel(int score){
        Levels[] allLevels = Levels.values();
        for(int i=1; i<=allLevels.length;i++){
            if(allLevels[i-1].getLevel()<=score && score<allLevels[i].getLevel())
                return allLevels[i-1];
        }
        return Levels.INDIANA_JONES;
    }

    public Levels nextLevel(int score){
        Levels[] allLevels = Levels.values();
        for(int i=1; i<=allLevels.length;i++){
            if(allLevels[i-1].getLevel()<=score && score<allLevels[i].getLevel())
                return allLevels[i];
        }
        return Levels.INDIANA_JONES;
    }

    public Integer numberOfVisitedCountries(Principal principal){
        Optional<User> user =userRepository.findByUsername(principal.getName());
        List<TripDTO> completedTrips = tripService.findAllByStatus(user.get().getId(), Status.VISITED);
        return completedTrips.size();
    }

    public Integer numberOfCountriesToVisit(Principal principal){
        Optional<User> user =userRepository.findByUsername(principal.getName());
        List<TripDTO> completedTrips = tripService.findAllByStatus(user.get().getId(), Status.TO_VISIT);
        return completedTrips.size();
    }

}
