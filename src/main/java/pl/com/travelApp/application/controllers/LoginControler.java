package pl.com.travelApp.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginControler {

    @GetMapping
    public String getLoginPager(){
        return "/WEB-INF/views/login-page.jsp";
    }
}
