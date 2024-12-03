public class Tournament {
    private String name;
    private String date;
    private String team1;
    private String team2;
    private String winner;
    private String location;
    private String videoUrl;
    private int team1Pts;
	private int team2Pts;
    private int team1Rebounds;
    private int team2Rebounds;
    private int team1Assists;
    private int team2Assists;
    private int team1Blocks;
    private int team2Blocks;
    private double team1FT;
    private double team2FT;
    private double team13PT;
    private double team23PT;
    private int team1TO;
    private int team2TO;

    // Getters and Setters
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getTeam1() {
        return team1;
    }
    public void setTeam1(String team1) {
        this.team1 = team1;
    }
    public String getTeam2() {
        return team2;
    }
    public void setTeam2(String team2) {
        this.team2 = team2;
    }
    public String getWinner() {
        return winner;
    }
    public void setWinner(String winner) {
        this.winner = winner;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public int getTeam1Pts() {
		return team1Pts;
	}
	public void setTeam1Pts(int team1Pts) {
		this.team1Pts = team1Pts;
	}
	public int getTeam2Pts() {
		return team2Pts;
	}
	public void setTeam2Pts(int team2Pts) {
		this.team2Pts = team2Pts;
	}
	public int getTeam1Rebounds() {
		return team1Rebounds;
	}
	public void setTeam1Rebounds(int team1Rebounds) {
		this.team1Rebounds = team1Rebounds;
	}
	public int getTeam2Rebounds() {
		return team2Rebounds;
	}
	public void setTeam2Rebounds(int team2Rebounds) {
		this.team2Rebounds = team2Rebounds;
	}
	public int getTeam1Assists() {
		return team1Assists;
	}
	public void setTeam1Assists(int team1Assists) {
		this.team1Assists = team1Assists;
	}
	public int getTeam2Assists() {
		return team2Assists;
	}
	public void setTeam2Assists(int team2Assists) {
		this.team2Assists = team2Assists;
	}
	public int getTeam1Blocks() {
		return team1Blocks;
	}
	public void setTeam1Blocks(int team1Blocks) {
		this.team1Blocks = team1Blocks;
	}
	public int getTeam2Blocks() {
		return team2Blocks;
	}
	public void setTeam2Blocks(int team2Blocks) {
		this.team2Blocks = team2Blocks;
	}
	public double getTeam1FT() {
		return team1FT;
	}
	public void setTeam1FT(double team1ft) {
		team1FT = team1ft;
	}
	public double getTeam2FT() {
		return team2FT;
	}
	public void setTeam2FT(double team2ft) {
		team2FT = team2ft;
	}
	public double getTeam13PT() {
		return team13PT;
	}
	public void setTeam13PT(double team13pt) {
		team13PT = team13pt;
	}
	public double getTeam23PT() {
		return team23PT;
	}
	public void setTeam23PT(double team23pt) {
		team23PT = team23pt;
	}
	public int getTeam1TO() {
		return team1TO;
	}
	public void setTeam1TO(int team1to) {
		team1TO = team1to;
	}
	public int getTeam2TO() {
		return team2TO;
	}
	public void setTeam2TO(int team2to) {
		team2TO = team2to;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
}
