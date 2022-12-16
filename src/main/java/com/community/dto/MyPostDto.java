package com.community.dto;

import java.util.Date;

public class MyPostDto {
	
	private int no;					// 게시글 번호
	private int boardNo;			// 게시판번호
	private String boardName;		// 게시판 이름
	private String title;			// 게시글 제목
	private int writerNo;			// 작성자번호이자 직원번호
	private Date createdDate;		// 게시글 등록일
	private int readCount;			// 조회수
	private int suggestionCount;	// 추천수
	private String content;			// 게시글 내용
	private String writerName;		// 작성자
	
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
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
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
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
	@Override
	public String toString() {
		return "MyPostDto [no=" + no + ", boardNo=" + boardNo + ", boardName=" + boardName + ", title=" + title
				+ ", writerNo=" + writerNo + ", createdDate=" + createdDate + ", readCount=" + readCount
				+ ", suggestionCount=" + suggestionCount + ", content=" + content + ", writerName=" + writerName + "]";
	}

}
