package pl.com.travelApp.application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pl.com.travelApp.application.dto.LogggedUserDTO;
import pl.com.travelApp.application.dto.RegisterUserDTO;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.repositories.UserRepository;

import java.util.Optional;

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

        User user = User.builder()
                .active(true)
                .username(userDTO.getUsername())
                .firstName(userDTO.getFirstName())
                .lastName(userDTO.getLastName())
                .password(encodedPassword)
                .build();

        userRepository.save(user);
    }

    public LogggedUserDTO getUser(String username){

        LogggedUserDTO logggedUserDTO =null;
        Optional<User> user = userRepository.findByUsername(username);
        if(user!= null){
            logggedUserDTO = new LogggedUserDTO();
            logggedUserDTO.setFirstName(user.get().getFirstName());
            logggedUserDTO.setLastName(user.get().getLastName());
            logggedUserDTO.setId(user.get().getId());
            logggedUserDTO.setUsername(user.get().getUsername());
        }
        return logggedUserDTO;
    }




}
