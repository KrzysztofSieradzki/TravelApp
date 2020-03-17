package pl.com.travelApp.application.dto;

import lombok.Data;

@Data
public class RegisterUserDTO {

    private String username;
    private String password;
    private String firstName;
    private String lastName;
}
