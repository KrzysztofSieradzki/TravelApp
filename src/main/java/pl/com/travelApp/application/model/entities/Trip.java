package pl.com.travelApp.application.model.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table
@Getter @Setter
public class Trip {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String target;
    @Column(nullable = false)
    private Integer year;
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    @Column(name="user_id", insertable = false, updatable = false)
    private Long userId;


    @Override
    public String toString() {
        return "Trip{" +
                "id=" + id +
                ", target='" + target + '\'' +
                ", year=" + year +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Trip trip = (Trip) o;
        return Objects.equals(id, trip.id) &&
                Objects.equals(target, trip.target) &&
                Objects.equals(year, trip.year);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, target, year);
    }
}
