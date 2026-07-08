package com.example.demo.service;

import com.example.demo.entity.Player;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.repository.PlayerRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PlayerService {

    private final PlayerRepository repository;

    public PlayerService(PlayerRepository repository) {
        this.repository = repository;
    }

    public List<Player> findAll() {
        return repository.findAll();
    }
public Player findByAccount(String account) {
    return repository.findByAccount(account)
            .orElseThrow(() -> new ResourceNotFoundException("Player not found"));
}
    public Player findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Player not found with id: " + id));
    }

    public Player create(Player player) {
        return repository.save(player);
    }

    public Player update(Long id, Player incoming) {
        Player player = findById(id);
        player.setAccount(incoming.getAccount());
        player.setPassword(incoming.getPassword());
        player.setNickname(incoming.getNickname());
        return repository.save(player);
    }

    public void delete(Long id) {
        Player player = findById(id);
        repository.delete(player);
    }
}
