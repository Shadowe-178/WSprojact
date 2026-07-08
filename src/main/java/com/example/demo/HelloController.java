package com.example.demo;

import com.example.demo.entity.Player;
import com.example.demo.service.PlayerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HelloController {

    private final PlayerService userService;

    public HelloController(PlayerService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String home(Model model) {
        List<Player> users = userService.findAll();
        model.addAttribute("message", "Spring Boot 測試頁面：服務已啟動！");
        model.addAttribute("users", users);
        return "index";
    }
}
