package com.exam;

public class ScoreBean {
	
//	필드
	private String name;
	private int kor;
	private int eng;
	private int math;

//	getters, setters	
	public String getName() {
		return name;
	}
	public int getKor() {
		return kor;
	}
	public int getEng() {
		return eng;
	}
	public int getMath() {
		return math;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public void setMath(int math) {
		this.math = math;
	}

	//	메소드
	public int getTotal() {
		return this.kor + this.eng + this.math;
	}
	public double getAvg() {
		return (this.kor + this.eng + this.math) / 3.0;
	}
	public String getGrade() {
		String grade = "";
		
		switch((int)this.getAvg() / 10) {
			case 10:
			case 9: grade = "A"; break;
			case 8: grade = "B"; break;
			case 7: grade = "C"; break;
			default: grade = "F";
		}
		
		return grade;
	}
}
