package com.community.vo;

public class PostReadings {
	
	private int readingPostNo;
	private int readingEmpNo;
	
	public PostReadings() {};
	
	public int getReadingEmpNo() {
		return readingEmpNo;
	}
	
	public void setReadingEmpNo(int readingEmpNo) {
		this.readingEmpNo = readingEmpNo;
	}
	
	public int getReadingPostNo() {
		return readingPostNo;
	}
	
	public void setReadingPostNo(int readingPostNo) {
		this.readingPostNo = readingPostNo;
	}

	@Override
	public String toString() {
		return "PostReadings [readingPostNo=" + readingPostNo + ", readingEmpNo=" + readingEmpNo + "]";
	}

}
