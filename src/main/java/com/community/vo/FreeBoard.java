package com.community.vo;

import java.util.Date;

public class FreeBoard {
	
	private int no;
	private int boardNo;
	private String title;
	private int writerNo; 
	private String content;
	private String important;
	private int readCount;
	private int suggestionCount;
	private int commentCount;
	private String deleted;
	private Date createdDate;
	private Date updatedDate;
	private Date deletedDate;
	
	public FreeBoard() {}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImportant() {
		return important;
	}
	public void setImportant(String important) {
		this.important = important;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getSuggestionCount() {
		return suggestionCount;
	}
	public void setSuggestionCount(int suggestionCount) {
		this.suggestionCount = suggestionCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
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
	@Override
	public String toString() {
		return "Free [no=" + no + ", boardNo=" + boardNo + ", title=" + title + ", writerNo=" + writerNo + ", content="
				+ content + ", important=" + important + ", readCount=" + readCount + ", suggestionCount="
				+ suggestionCount + ", commentCount=" + commentCount + ", deleted=" + deleted + ", createdDate="
				+ createdDate + ", updatedDate=" + updatedDate + ", deletedDate=" + deletedDate + "]";
	}
}
