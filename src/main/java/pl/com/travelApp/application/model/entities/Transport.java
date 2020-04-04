package pl.com.travelApp.application.model.entities;

import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import pl.com.travelApp.application.model.enums.Transports;

import javax.persistence.*;
import java.util.Objects;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "transport")
public class Transport extends EntityBase{
    @Enumerated(EnumType.STRING)
    private Transports transports;
    private Double cost;
    @ManyToOne
    @JoinColumn(name="trip_id")
    private Trip trip;
    @Column(name="trip_id", insertable = false, updatable = false)
    private Long tripId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Transport transport = (Transport) o;
        return transports == transport.transports &&
                Objects.equals(cost, transport.cost) &&
                Objects.equals(trip, transport.trip) &&
                Objects.equals(tripId, transport.tripId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(transports, cost, trip, tripId);
    }

    @Override
    public String toString() {
        return "Transport{" +
                "cost=" + cost +
                ", trip=" + trip +
                '}';
    }
}
