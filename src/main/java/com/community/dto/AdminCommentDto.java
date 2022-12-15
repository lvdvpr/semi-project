package com.community.dto;

import java.util.Date;

import com.community.vo.Comment;

// 관리자  댓글
public class AdminCommentDto {
	
	// 댓글번호
	private int cno;
	// 직원번호
	private int empNo;
	// 댓글내용
	private String content;
	// 삭제여부
	private String deleted;
	// 직원명
	private String name;
	// 댓글등록일
	private Date createdDate;
	private Date updatedDate;
	private Date deletedDate;
	// 글번호
	private int postNo;
	
	
	public AdminCommentDto () {
		
	}
	
	public Comment getComment() {
		Comment comment = new Comment();
		comment.setNo(cno);
		comment.setEmpNo(empNo);
		comment.setContent(content);
		comment.setDeleted(deleted);
		comment.setPostNo(postNo);
		
		return comment;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Date getDeletedDate() {
		return deletedDate;
	}

	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "AdminCommentDto [cno=" + cno + ", empNo=" + empNo + ", content=" + content + ", deleted=" + deleted
				+ ", name=" + name + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate="
				+ deletedDate + ", postNo=" + postNo + "]";
	}

	

	
	
	
	
}