package pl.com.travelApp.application.model.entities;

import lombok.*;


import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor
@EqualsAndHashCode(of = "id") @ToString(exclude = {"password","trips"})
@Builder
@Entity
@Table(name = "users")
public class User extends EntityBase {

    @Column(unique = true, nullable = false)
    private String username;
    @Column(name = "first_name")
    private String firstName;
    @Column(name= "last_name")
    private String lastName;
    @Column(nullable = false)
    private boolean active;
    @Column(nullable = false)
    private String password;
    @OneToMany(mappedBy = "user")
    private List<Trip> trips;

}
