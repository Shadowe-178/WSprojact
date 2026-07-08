package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "player")
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, unique = true)
    private String account;

    @NotBlank
    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String nickname;

    private Integer level = 1;

    private Integer exp = 0;

    private Integer totalGames = 0;

    private Integer winCount = 0;

    private Integer undoCount = 0;

    // Constructors
    public Player() {
    }

    public Player(String account, String password, String nickname) {
        this.account = account;
        this.password = password;
        this.nickname = nickname;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    public Integer getTotalGames() {
        return totalGames;
    }

    public void setTotalGames(Integer totalGames) {
        this.totalGames = totalGames;
    }

    public Integer getWinCount() {
        return winCount;
    }

    public void setWinCount(Integer winCount) {
        this.winCount = winCount;
    }

    public Integer getUndoCount() {
        return undoCount;
    }

    public void setUndoCount(Integer undoCount) {
        this.undoCount = undoCount;
    }

   @Override
public String toString() {
    return "Player{" +
            "id=" + id +
            ", account='" + account + '\'' +
            ", nickname='" + nickname + '\'' +
            ", level=" + level +
            ", exp=" + exp +
            ", totalGames=" + totalGames +
            ", winCount=" + winCount +
            ", undoCount=" + undoCount +
            '}';
    }
}
