package pl.com.travelApp.application.model.entities;

import lombok.*;
import pl.com.travelApp.application.model.enums.Categories;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id") @ToString()
@Builder
@Entity
@Table(name = "equipment")
public class Equipment extends EntityBase {
    @Column(nullable = false)
    private String name;
    private Integer quantity;
    private Boolean active;
    private String description;
    @ManyToOne
    private Trip trip;
    @Enumerated(EnumType.STRING)
    private Categories categories;
}
