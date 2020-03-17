package pl.com.travelApp.application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.RegisterUserDTO;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.repositories.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void saveUser(RegisterUserDTO userDTO){

        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());

        User user = new User();
        user.setActive(true);
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setPassword(encodedPassword);
        user.setUsername(userDTO.getUsername());

        userRepository.save(user);
    }
}
