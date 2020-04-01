package pl.com.travelApp.application.dto;

import lombok.Data;
import pl.com.travelApp.application.model.entities.Trip;
@Data
public class EquipmentDTO {
    private String name;
    private Integer quantity;
    private Boolean active;
    private String description;
    private Trip trip;
}
