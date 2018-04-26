package com.oracle.carshop.model.bean;

public class User {
	
	private int userid;
	private String username;
	private String password;
	private String nickname;
	private int age;
	private String sex;
	private String image;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public User(int userid, String username, String password, String nickname, int age, String sex, String image) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.nickname = nickname;
		this.age = age;
		this.sex = sex;
		this.image = image;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", nickname=" + nickname
				+ ", age=" + age + ", sex=" + sex + ", image=" + image + "]";
	}
	

}
