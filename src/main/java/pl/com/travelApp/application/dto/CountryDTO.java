package pl.com.travelApp.application.dto;

import lombok.Data;

@Data
public class CountryDTO {

    private String country_code;
    private String name;
    private String currency;
    private String continent;
    private String language;
}
