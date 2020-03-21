package pl.com.travelApp.application.dto;

import lombok.Builder;
import lombok.Data;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.enums.Countries;
import pl.com.travelApp.application.model.enums.Status;

@Data
public class TripDTO {

    private Long id;
    private Countries id_country;
    private Status status;
    private Integer year;
    private User user;
}
