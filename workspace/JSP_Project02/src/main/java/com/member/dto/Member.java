package com.member.dto;

public class Member {
//	멤버
	public String name;
	public String userID;
	public String password;
	public String tel;
	public String email;
	public int admin;
	
//	getters, setters
	public String getName() {
		return name;
	}
	public String getUserID() {
		return userID;
	}
	public String getPassword() {
		return password;
	}
	public String getTel() {
		return tel;
	}
	public String getEmail() {
		return email;
	}
	public int getAdmin() {
		return admin;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
}
