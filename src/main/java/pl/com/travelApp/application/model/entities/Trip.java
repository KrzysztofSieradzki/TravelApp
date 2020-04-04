package pl.com.travelApp.application.model.entities;

import lombok.*;
import pl.com.travelApp.application.model.enums.Countries;
import pl.com.travelApp.application.model.enums.Status;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;
@Getter @Setter @AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table
public class Trip extends EntityBase {

    @Enumerated(EnumType.ORDINAL)
    private Countries id_country;
    @Column(nullable = true)
    private String name;
    @Enumerated(EnumType.STRING)
    private Status status;
    @Column(nullable = false)
    private Integer year;
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    @Column(name="user_id", insertable = false, updatable = false)
    private Long userId;
    @OneToMany(mappedBy = "trip")
    private List<Equipment> equipmentList;
    @OneToMany(mappedBy = "trip")
    private List<Transport> transport;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Trip trip = (Trip) o;
        return id_country == trip.id_country &&
                Objects.equals(name, trip.name) &&
                status == trip.status &&
                Objects.equals(year, trip.year) &&
                Objects.equals(user, trip.user) &&
                Objects.equals(userId, trip.userId) &&
                Objects.equals(equipmentList, trip.equipmentList) &&
                Objects.equals(transport, trip.transport);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id_country, name, status, year, user, userId, equipmentList, transport);
    }

    @Override
    public String toString() {
        return "Trip{" +
                "id_country=" + id_country +
                ", name='" + name + '\'' +
                ", status=" + status +
                ", year=" + year +
                ", user=" + user +
                ", userId=" + userId +
                ", equipmentList=" + equipmentList +
                ", transport=" +
                '}';
    }
}
