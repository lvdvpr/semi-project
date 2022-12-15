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
	private String empEmail;
	private String empPhone;
	private int empDeptNo;
	private int empPositionNo;
	private String empType;
	private String empDeleted;
	private Date empCreatedDate;
	private Date empUpdatedDate;
	private Date empDeletedDate;
	
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

	public void setEmpNamae(String empName) {
		this.empName = empName;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
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

	public String getEmpType() {
		return empType;
	}

	public void setEmpType(String empType) {
		this.empType = empType;
	}

	public String getEmpDeleted() {
		return empDeleted;
	}

	public void setEmpDeleted(String empDeleted) {
		this.empDeleted = empDeleted;
	}

	public Date getEmpCreatedDate() {
		return empCreatedDate;
	}

	public void setEmpCreatedDate(Date empCreatedDate) {
		this.empCreatedDate = empCreatedDate;
	}

	public Date getEmpUpdatedDate() {
		return empUpdatedDate;
	}

	public void setEmpUpdatedDate(Date empUpdatedDate) {
		this.empUpdatedDate = empUpdatedDate;
	}

	public Date getEmpDeletedDate() {
		return empDeletedDate;
	}

	public void setEmpDeletedDate(Date empDeletedDate) {
		this.empDeletedDate = empDeletedDate;
	}

	@Override
	public String toString() {
		return "CommentDto [commentNo=" + commentNo + ", commentEmpNo=" + commentEmpNo + ", commentContent="
				+ commentContent + ", commentDeleted=" + commentDeleted + ", commentCreatedDate=" + commentCreatedDate
				+ ", commentUpdatedDate=" + commentUpdatedDate + ", commentDeletedDate=" + commentDeletedDate
				+ ", commentPostNo=" + commentPostNo + ", empNo=" + empNo + ", empPassword=" + empPassword
				+ ", empName=" + empName + ", empEmail=" + empEmail + ", empPhone=" + empPhone + ", empDeptNo="
				+ empDeptNo + ", empPositionNo=" + empPositionNo + ", empType=" + empType + ", empDeleted=" + empDeleted
				+ ", empCreatedDate=" + empCreatedDate + ", empUpdatedDate=" + empUpdatedDate + ", empDeletedDate="
				+ empDeletedDate + "]";
	}
	
	
}
