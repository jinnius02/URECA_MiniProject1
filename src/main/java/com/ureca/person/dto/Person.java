package com.ureca.person.dto;

public class Person {
	private int no;
    private String name;
    private int calorie;
    private String best;
    private String photoFilename;  // 사진 파일 이름을 저장하는 필드 추가
    
    public Person() {
		// TODO Auto-generated constructor stub
	}

	public Person(int no, String name, int calorie, String best, String photoFilename) {
		super();
		this.no = no;
		this.name = name;
		this.calorie = calorie;
		this.best = best;
		this.photoFilename = photoFilename;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCalorie() {
		return calorie;
	}

	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}

	public String getBest() {
		return best;
	}

	public void setBest(String best) {
		this.best = best;
	}
	
	public String getPhotoFilename() {
		return photoFilename;
	}

	public void setPhotoFilename(String photoFilename) {
		this.photoFilename = photoFilename;
	}
	
	@Override
	public String toString() {
		return "Person [no=" + no + ", name=" + name + ", calorie=" + calorie + ", best=" + best +", photoFilename=" + photoFilename + "]";
	}
    
    
}
