package pl.com.travelApp.application.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.travelApp.application.dto.RegisterUserDTO;
import pl.com.travelApp.application.service.UserService;

@Controller
@RequestMapping("/register")
@Slf4j
public class RegistrationController {

   private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String prepareRegistrationPage(){
        return "registration-page";
    }

    @PostMapping
    public String processRegistrationPage(RegisterUserDTO registerUserDTO){

        try{
            userService.saveUser(registerUserDTO);
        }catch (RuntimeException e){
            e.printStackTrace();
            return "redirect:/register";
        }

        log.info("User has been saved as : " + registerUserDTO.getUsername());

        return "login-page";
    }

}
