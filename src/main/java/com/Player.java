package com;
public class Player {
    private String name;
    private String team;
    private String position;
    private int age;
    private String height;
    private double weight;
    private String college;
    private String imageUrl;
	private int yearInNBA;
	
	public Player(String name, String team, String position, int age, String height, double weight, String college,
			int yearInNBA, String imageUrl) { //Creation of player object, which stores information for each player
		super();
		this.name = name;
		this.team = team;
		this.position = position;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.college = college;
		this.imageUrl = imageUrl;
		this.yearInNBA = yearInNBA;
	}
	
	//Getters and setters for Player object
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public int getYearInNBA() {
		return yearInNBA;
	}
	public void setYearInNBA(int yearInNBA) {
		this.yearInNBA = yearInNBA;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}