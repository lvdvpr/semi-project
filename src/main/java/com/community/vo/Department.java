package com.community.vo;

public class Department {

	
	private int no;		// 소속부서번호
	private String name;
	
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
	@Override
	public String toString() {
		return "Department [no=" + no + ", name=" + name + "]";
	}
	
}
