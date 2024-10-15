public class Team {
    private String name;
    private String city;
    private String stadium;

    public Team() {
        super();
    }

    public Team(String name, String city, String stadium) {
        super();
        this.name = name;
        this.city = city;
        this.stadium = stadium;
    }

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
}
