package pl.com.travelApp.application.dto;

import lombok.Data;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.enums.Transports;

@Data
public class TransportDTO {
    private Transports transports;
    private Double cost;
    private Trip trip;
}
