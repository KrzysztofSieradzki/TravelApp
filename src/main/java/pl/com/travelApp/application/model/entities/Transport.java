package pl.com.travelApp.application.model.entities;

import lombok.*;
import pl.com.travelApp.application.model.enums.Transports;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id") @ToString()
@Builder
@Entity
@Table(name = "transport")
public class Transport extends EntityBase{
    @Enumerated(EnumType.STRING)
    private Transports transports;
    private Double cost;
    @ManyToOne
    private Trip trip;
}
