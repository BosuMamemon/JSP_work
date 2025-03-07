package com.address;

public class Address {
	
//	필드
	private int num;
	private String name;
	private String zipcode;
	private String address;
	private String tel;
	
//	생성자
	public Address() {}
	public Address(int num, String name, String zipcode, String address, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.zipcode = zipcode;
		this.address = address;
		this.tel = tel;
	}


	//	getters, setters
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public String getAddress() {
		return address;
	}
	public String getTel() {
		return tel;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
