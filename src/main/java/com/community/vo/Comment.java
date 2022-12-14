package com.community.vo;

import java.util.Date;

public class Comment {

	private int commentNo;				// comm_posts_comment 테이블
	private int commentEmpNo;			// comm_posts_comment 테이블
	private String commentContent;		// comm_posts_comment 테이블
	private String commentDeleted;		// comm_posts_comment 테이블
	private Date commentCreatedDate;	// comm_posts_comment 테이블
	private Date commentUpdatedDate;	// comm_posts_comment 테이블
	private Date commentDeletedDate;	// comm_posts_comment 테이블
	private int commentPostNo;
	
	public Comment() {}

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

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentEmpNo=" + commentEmpNo + ", commentContent="
				+ commentContent + ", commentDeleted=" + commentDeleted + ", commentCreatedDate=" + commentCreatedDate
				+ ", commentUpdatedDate=" + commentUpdatedDate + ", commentDeletedDate=" + commentDeletedDate
				+ ", commentPostNo=" + commentPostNo + "]";
	}
	
	
}
