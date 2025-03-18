package com.product.model;

public class ProductDTO {
	
//	필드
	private int pNum;
	private String name;
	private int unitPrice;
	private String description;
	private String ofile;	// Original file <- 원래 파일
	private String sfile;	// Save File <- 저장용으로 가공된 파일
	
//	getters, setters
	public int getpNum() {
		return pNum;
	}
	public String getName() {
		return name;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public String getOfile() {
		return ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	
}
