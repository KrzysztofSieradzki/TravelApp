package pl.com.travelApp.application.model.entities;

import lombok.*;

import javax.persistence.*;
import java.util.Objects;
@Getter @Setter @AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id") @ToString(exclude = {"password","trips"})
@Builder
@Entity
@Table
public class Trip extends EntityBase {

    @Column(nullable = false)
    private String target;
    @Column(nullable = false)
    private Integer year;
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    @Column(name="user_id", insertable = false, updatable = false)
    private Long userId;

}
