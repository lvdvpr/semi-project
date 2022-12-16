package com.community.dto;

import java.util.Date;

public class CommentDto {

	
	// comm_posts_comment 테이블
	private int commentNo;				
	private int commentEmpNo;			
	private String commentContent;		
	private String commentDeleted;		
	private Date commentCreatedDate;	
	private Date commentUpdatedDate;	
	private Date commentDeletedDate;	
	private int commentPostNo;			
	// comm_employees 테이블
	private int empNo;					
	private int empPassword;
	private String empName;
	private int empDeptNo;
	private int empPositionNo;
	
	public CommentDto () {}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentEmpNo() {
		return commentEmpNo;
	}

	public void setCommentEmpNo(int commentEmpNo) {
		this.commentEmpNo = commentEmpNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentDeleted() {
		return commentDeleted;
	}

	public void setCommentDeleted(String commentDeleted) {
		this.commentDeleted = commentDeleted;
	}

	public Date getCommentCreatedDate() {
		return commentCreatedDate;
	}

	public void setCommentCreatedDate(Date commentCreatedDate) {
		this.commentCreatedDate = commentCreatedDate;
	}

	public Date getCommentUpdatedDate() {
		return commentUpdatedDate;
	}

	public void setCommentUpdatedDate(Date commentUpdatedDate) {
		this.commentUpdatedDate = commentUpdatedDate;
	}

	public Date getCommentDeletedDate() {
		return commentDeletedDate;
	}

	public void setCommentDeletedDate(Date commentDeletedDate) {
		this.commentDeletedDate = commentDeletedDate;
	}

	public int getCommentPostNo() {
		return commentPostNo;
	}

	public void setCommentPostNo(int commentPostNo) {
		this.commentPostNo = commentPostNo;
	}


	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public int getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(int empPassword) {
		this.empPassword = empPassword;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public int getEmpDeptNo() {
		return empDeptNo;
	}

	public void setEmpDeptNo(int empDeptNo) {
		this.empDeptNo = empDeptNo;
	}

	public int getEmpPositionNo() {
		return empPositionNo;
	}

	public void setEmpPositionNo(int empPositionNo) {
		this.empPositionNo = empPositionNo;
	}


	
}
