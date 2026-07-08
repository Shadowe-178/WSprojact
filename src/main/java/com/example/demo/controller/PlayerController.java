package com.example.demo.controller;

import com.example.demo.entity.Player;
import com.example.demo.service.PlayerService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/player")
public class PlayerController {

    private final PlayerService service;

    public PlayerController(PlayerService service) {
        this.service = service;
    }
@GetMapping
public List<Player> getAllPlayers() {
    return service.findAll();
}
 @PostMapping
    public Player createPlayer(@RequestBody Player player) {
        return service.create(player);
    }
}