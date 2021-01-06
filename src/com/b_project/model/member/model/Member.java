package com.b_project.model.member.model;

import java.util.Date;

public class Member {

	// 변수
	private String id;
	private String name;
	private String password;
	private String tel;
	private String eMail;
	private Date regDate;
	private int level;
	
	// 생성자
	public Member(String id, String name, String password, String tel, String eMail, Date regdate,
			int level) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.tel = tel;
		this.eMail = eMail;
		this.regDate = regdate;
		this.level = level;
	}
	
	public Member(String id, String name, String password, String tel, String eMail) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.tel = tel;
		this.eMail = eMail;
	}



	// 메서드
	
	
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
}
