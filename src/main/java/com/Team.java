package com;

public class Team {
    private String name;
    private String city;
    private String stadium;
    private TeamStats stats; // New field for statistics

    public Team() {
        super();
    }

    public Team(String name, String city, String stadium, TeamStats stats) {
        super();
        this.name = name;
        this.city = city;
        this.stadium = stadium;
        this.stats = stats;
    }

    // Existing getters and setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStadium() {
        return stadium;
    }

    public void setStadium(String stadium) {
        this.stadium = stadium;
    }

    // New getter and setter for stats
    public TeamStats getStats() {
        return stats;
    }

    public void setStats(TeamStats stats) {
        this.stats = stats;
    }
}
