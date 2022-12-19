package com.community.vo;

public class Suggestion {

	private int suggestionPostNo;
	private int postNo;
	private int empNo;

	
	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public Suggestion() {};
	
	public int getSuggestionPostNo() {
		return suggestionPostNo;
	}
	public void setSuggestionPostNo(int suggestionPostNo) {
		this.suggestionPostNo = suggestionPostNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
}