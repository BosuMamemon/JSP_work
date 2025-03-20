package com.board.model;

public class BoardDTO {

//	필드
	private int num;
	private String userID;
	private String subject;
	private String email;
	private int readCount;
	private String content;
	private String regdate;
	
//	생성자
	public BoardDTO() {}
	
	
//	getters, setters
	public int getNum() {
		return num;
	}
	public String getUserID() {
		return userID;
	}
	public String getSubject() {
		return subject;
	}
	public String getEmail() {
		return email;
	}
	public int getReadCount() {
		return readCount;
	}
	public String getContent() {
		return content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
