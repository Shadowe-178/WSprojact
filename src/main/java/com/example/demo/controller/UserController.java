package com.example.demo.controller;

import com.example.demo.entity.Player;
import com.example.demo.service.PlayerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final PlayerService service;

    public UserController(PlayerService service) {
        this.service = service;
    }

    @GetMapping
    public List<Player> all() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public Player get(@PathVariable Long id) {
        return service.findById(id);
    }

    @PostMapping
    public ResponseEntity<Player> create(@Validated @RequestBody Player user) {
        Player created = service.create(user);
        return ResponseEntity.created(URI.create("/api/users/" + created.getId())).body(created);
    }

    @PutMapping("/{id}")
    public Player update(@PathVariable Long id, @Validated @RequestBody Player user) {
        return service.update(id, user);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        service.delete(id);
    }
}
