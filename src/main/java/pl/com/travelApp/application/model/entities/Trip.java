package pl.com.travelApp.application.model.entities;

import lombok.*;
import pl.com.travelApp.application.model.enums.Countries;
import pl.com.travelApp.application.model.enums.Status;

import javax.persistence.*;
import java.util.Objects;
@Getter @Setter @AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode @ToString(exclude = {"user"})
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

}
