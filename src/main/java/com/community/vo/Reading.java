package com.community.vo;

public class Reading {

	private int postNo;
	private int empNo;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "Reading [postNo=" + postNo + ", empNo=" + empNo + "]";
	}
	
	
}
