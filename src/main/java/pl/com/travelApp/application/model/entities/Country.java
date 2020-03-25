package pl.com.travelApp.application.model.entities;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
@Builder
@Entity
@Table
public class Country extends EntityBase {

    @Column(unique = true, name = "country_code")
    private String countryCode;
    @Column(unique = true)
    private String name;
    private String currency;
    private String continent;
    private String language;

}
