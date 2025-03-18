package com.board.model;

public class CommentsDTO {

//	필드
	private int cNum, bNum;
	private String userID, comment, regdate;
	
//	생성자
	public CommentsDTO() {}
	public CommentsDTO(String userID, String comment, int bNum) {
		super();
		this.cNum = cNum;
		this.bNum = bNum;
		this.userID = userID;
		this.comment = comment;
		this.regdate = regdate;
	}

//	getters, setters
	public int getcNum() {
		return cNum;
	}

	public int getbNum() {
		return bNum;
	}

	public String getUserID() {
		return userID;
	}

	public String getComment() {
		return comment;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
