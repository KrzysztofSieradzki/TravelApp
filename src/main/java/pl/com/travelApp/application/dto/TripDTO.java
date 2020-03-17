package pl.com.travelApp.application.dto;

import lombok.Builder;
import lombok.Data;
import pl.com.travelApp.application.model.entities.User;

@Data
public class TripDTO {

    private String target;
    private Integer year;
    private User user;
}
