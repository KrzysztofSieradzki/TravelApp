package pl.com.travelApp.application.dto;

import lombok.Data;
import pl.com.travelApp.application.model.entities.Trip;
import pl.com.travelApp.application.model.enums.Categories;

@Data
public class EquipmentDTO {
    private String name;
    private Integer quantity;
    private Boolean active;
    private String description;
    private Trip trip;
    private Categories categories;
}
