package com.community.dto;

import java.util.Date;

import com.community.vo.FreeBoard;

public class PostDto {

	private int postNo;           	    // comm_posts 테이블
	private int postBoardNo;			// comm_posts 테이블
	private String postTitle;			// comm_posts 테이블
	private int postWriterNo;			// comm_posts 테이블
	private String postContent;			// comm_posts 테이블
	private String postImportant;		// comm_posts 테이블
	private int postReadCount;			// comm_posts 테이블
	private int postSuggestionCount;	// comm_posts 테이블
	private int postCommentCount;		// comm_posts 테이블
	private String postDeleted;			// comm_posts 테이블
	private Date postCreatedDate;		// comm_posts 테이블
	private Date postUpdatedDate;		// comm_posts 테이블
	private Date postDeletedDate; 		// comm_posts 테이블
	private int empNo;					// comm_employees 테이블
	private String empName;				// comm_employees 테이블
	private int positionNo;				// comm_employees 테이블
	private String positionName;		// comm_positions 테이블
	private int departmentNo;			// comm_departments 테이블
	private String departmentName;		// comm_departments 테이블
	
	
	public PostDto () {
		
	}

	public FreeBoard getFreeBoard() {
		FreeBoard freeBoard = new FreeBoard();
		freeBoard.setNo(postNo);  		 // FreeBoard에 dto값 넣기
		freeBoard.setBoardNo(postBoardNo);
		freeBoard.setTitle(postTitle);
		freeBoard.setWriterNo(postWriterNo);
		freeBoard.setContent(postContent);
		freeBoard.setImportant(postImportant);
		freeBoard.setReadCount(postReadCount);
		freeBoard.setSuggestionCount(postSuggestionCount);
		freeBoard.setCommentCount(postCommentCount);
		freeBoard.setDeleted(postDeleted);
		freeBoard.setCreatedDate(postCreatedDate);
		freeBoard.setUpdatedDate(postUpdatedDate);
		freeBoard.setDeletedDate(postDeletedDate);
		
		return freeBoard; 				// dto값 넣은 freeBoard 반환하기
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

	public int getPostWriterNo() {
		return postWriterNo;
	}

	public void setPostWriterNo(int postWriterNo) {
		this.postWriterNo = postWriterNo;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostImportant() {
		return postImportant;
	}

	public void setPostImportant(String postImportant) {
		this.postImportant = postImportant;
	}

	public int getPostReadCount() {
		return postReadCount;
	}

	public void setPostReadCount(int postReadCount) {
		this.postReadCount = postReadCount;
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
	
	public Date getPostUpdatedDate() {
		return postUpdatedDate;
	}
	
	public void setPostUpdatedDate(Date postUpdatedDate) {
		this.postUpdatedDate = postUpdatedDate;
	}
	
	public Date getPostDeletedDate() {
		return postDeletedDate;
	}
	
	public void setPostDeletedDate(Date postDeletedDate) {
		this.postDeletedDate = postDeletedDate;
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

	
}
