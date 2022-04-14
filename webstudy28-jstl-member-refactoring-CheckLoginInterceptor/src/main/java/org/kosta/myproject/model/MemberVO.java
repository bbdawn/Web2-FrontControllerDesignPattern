package org.kosta.myproject.model;

import java.io.Serializable;
// 서버 리로드 될때 WAS가 세션 객체를 직렬화하여 백업하고 다시 역직렬화하여 세션 객체를 복원하므로 
// 세션에 저장되는 객체는 아래처럼 implements 를 권장한다 
public class MemberVO implements Serializable{	
	private static final long serialVersionUID = 4346814110024116154L;
	private String id;
	private String password;
	private String name;
	private String address;
	private String birthday;
	private String regdate;
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String password, String name, String address, String birthday, String regdate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.birthday = birthday;
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", birthday=" + birthday + ", regdate=" + regdate + "]";
	}
	
}
