package com.community.dto;

import java.util.Date;

import com.community.vo.FreeBoard;

public class PostDto {

	private int postNo;
	private int postBoardNo;
	private String postTitle;
	private int postReadCount;
	private String postContent;
	private Date postCreatedDate;
	private int postSuggestionCount;
	private int postCommentCount;
	private int empNo;
	private String empName;
	private int positionNo;
	private String positionName;
	private int departmentNo;
	private String departmentName;
	private String postDeleted;
	private String postImportant;
	
	
	public PostDto () {
		
	}

	public FreeBoard getFreeBoard() {
		FreeBoard freeBoard = new FreeBoard();
		freeBoard.setNo(postNo);  // FreeBoard에 dto값 넣기
		freeBoard.setBoardNo(postBoardNo);
		freeBoard.setTitle(postTitle);
		freeBoard.setContent(postContent);
		freeBoard.setReadCount(postReadCount);
		freeBoard.setSuggestionCount(postSuggestionCount);
		freeBoard.setCommentCount(postCommentCount);
		freeBoard.setDeleted(postDeleted);
		freeBoard.setImportant(postImportant);
		
		
		return freeBoard; // dto값 넣은 freeBoard 리턴
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	public int getPostBoardNo() {
		return postBoardNo;
	}
	
	public void setPostBoardNo(int postBoardNo) {
		this.postBoardNo = postBoardNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public int getPostReadCount() {
		return postReadCount;
	}

	public void setPostReadCount(int postReadCount) {
		this.postReadCount = postReadCount;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostDeleted() {
		return postDeleted;
	}
	
	public void setPostDeleted(String postDeleted) {
		this.postDeleted = postDeleted;
	}
	public Date getPostCreatedDate() {
		return postCreatedDate;
	}

	public void setPostCreatedDate(Date postCreatedDate) {
		this.postCreatedDate = postCreatedDate;
	}

	public int getPostSuggestionCount() {
		return postSuggestionCount;
	}

	public void setPostSuggestionCount(int postSuggestionCount) {
		this.postSuggestionCount = postSuggestionCount;
	}

	public int getPostCommentCount() {
		return postCommentCount;
	}

	public void setPostCommentCount(int postCommentCount) {
		this.postCommentCount = postCommentCount;
	}
	
	public int getEmpNo() {
		return empNo;
	}
	
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getPositionNo() {
		return positionNo;
	}

	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public int getDepartmentNo() {
		return departmentNo;
	}

	public void setDepartmentNo(int departmentNo) {
		this.departmentNo = departmentNo;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	public String getPostImportant() {
		return postImportant;
	}
	
	public void setPostImportant(String postImportant) {
		this.postImportant = postImportant;
	}
	
}
