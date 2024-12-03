package com;
public class TeamStats {
	private double PPG = 0;
    private double APG = 0;
    private double SPG = 0;
    private double BPG = 0;
    private double TOPG = 0;
    private double FTPercentage = 0;
    private double threePTPercentage = 0;
    private int gamesPlayed = 0;
    private int wins = 0;
    private int losses = 0;
    private double winPercentage;

    // Getters and Setters
    public double getPPG() { return PPG; }
    public void setPPG(double pPG) { PPG = pPG; }

    public double getAPG() { return APG; }
    public void setAPG(double aPG) { APG = aPG; }

    public double getSPG() { return SPG; }
    public void setSPG(double sPG) { SPG = sPG; }

    public double getBPG() { return BPG; }
    public void setBPG(double bPG) { BPG = bPG; }

    public double getTOPG() { return TOPG; }
    public void setTOPG(double tOPG) { TOPG = tOPG; }

    public double getFTPercentage() { return FTPercentage; }
    public void setFTPercentage(double fTPercentage) { FTPercentage = fTPercentage; }

    public double getThreePTPercentage() { return threePTPercentage; }
    public void setThreePTPercentage(double threePTPercentage) { this.threePTPercentage = threePTPercentage; }

    public int getGamesPlayed() { return gamesPlayed; }
    public void setGamesPlayed(int gamesPlayed) { this.gamesPlayed = gamesPlayed; }

    public int getWins() { return wins; }
    public void setWins(int wins) { this.wins = wins; }

    public int getLosses() { return losses; }
    public void setLosses(int losses) { this.losses = losses; }

    public double getWinPercentage() { return winPercentage; }
    public void setWinPercentage(double winPercentage) { this.winPercentage = winPercentage; }
}
