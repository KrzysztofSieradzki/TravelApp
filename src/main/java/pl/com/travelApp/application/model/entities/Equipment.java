package pl.com.travelApp.application.model.entities;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id") @ToString()
@Builder
@Entity
@Table(name = "equipment")
public class Equipment extends EntityBase {

    private String name;
    private Integer quantity;
    private Boolean active;
    private String description;
    @ManyToOne
    private Trip trip;
}
