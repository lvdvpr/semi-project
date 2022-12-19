package com.community.dto;

import java.util.Date;

public class MyCommentDto {
	
	private int no;				// 댓글번호
	private int empNo;			// 댓글 작성자 직원번호
	private String content;
	private String deleted;		// 댓글 삭제
	private Date createdDate;
	private Date updatedDate;
	private Date deletedDate;
	private int postNo;			// 게시글 번호
	private int boardNo;		// 게시판 번호
	private String boardName;	// 게시판 이름
	private String moveName;	// 게시판 이름 (영어)
	
	
	public String getMoveName() {
		return moveName;
	}
	public void setMoveName(String moveName) {
		this.moveName = moveName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	@Override
	public String toString() {
		return "MyCommentDto [no=" + no + ", empNo=" + empNo + ", content=" + content + ", deleted=" + deleted
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate=" + deletedDate
				+ ", postNo=" + postNo + ", boardNo=" + boardNo + ", boardName=" + boardName + ", moveName=" + moveName
				+ "]";
	}
	
}
