package com.member.model;

public class MemberDTO {
	
//	필드
	private String name;
	private String userID;
	private String password;
	private String email;
	private String tel;
	private int admin;
	
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
	public String getEmail() {
		return email;
	}
	public String getTel() {
		return tel;
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
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	
}
