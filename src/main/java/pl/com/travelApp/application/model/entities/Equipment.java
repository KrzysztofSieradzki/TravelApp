package pl.com.travelApp.application.model.entities;

import lombok.*;
import pl.com.travelApp.application.model.enums.Categories;

import javax.persistence.*;
import java.util.Objects;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "equipment")
public class Equipment extends EntityBase {
    @Column(nullable = false)
    private String name;
    private Integer quantity;
    private Boolean active;
    private String description;
    @Enumerated(EnumType.STRING)
    private Categories categories;
    @ManyToOne
    @JoinColumn(name="trip_id")
    private Trip trip;
    @Column(name="trip_id", insertable = false, updatable = false)
    private Long tripId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Equipment equipment = (Equipment) o;
        return Objects.equals(name, equipment.name) &&
                Objects.equals(quantity, equipment.quantity) &&
                Objects.equals(active, equipment.active) &&
                Objects.equals(description, equipment.description) &&
                Objects.equals(trip, equipment.trip) &&
                categories == equipment.categories;
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, quantity, active, description, trip, categories);
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "name='" + name + '\'' +
                ", quantity=" + quantity +
                ", active=" + active +
                ", description='" + description + '\'' +
                '}';
    }
}

