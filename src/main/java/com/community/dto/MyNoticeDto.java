package com.community.dto;

import java.util.Date;

public class MyNoticeDto {
	
	private int no;					// 알림번호
	private int postNo;				// 게시글 번호
	private int sendEmpNo;			// 송신자 직원번호
	private String sendEmpName;		// 송신자 직원이름
	private int receiveEmpNo;		// 수신자 직원번호
	private String content;			// 알림 내용
	private String readingStatus;	// 알림열람여부
	private String deleted;			// 알림삭제여부
	private Date createdDate;		// 알림등록일
	private Date updatedDate;		// 알림수정일
	private Date deletedDate;		// 알림삭제일
	private int boardNo;			// 게시판 번호
	private String boardName;		// 게시판 이름
	
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getSendEmpNo() {
		return sendEmpNo;
	}
	public void setSendEmpNo(int sendEmpNo) {
		this.sendEmpNo = sendEmpNo;
	}
	public String getSendEmpName() {
		return sendEmpName;
	}
	public void setSendEmpName(String sendEmpName) {
		this.sendEmpName = sendEmpName;
	}
	public int getReceiveEmpNo() {
		return receiveEmpNo;
	}
	public void setReceiveEmpNo(int receiveEmpNo) {
		this.receiveEmpNo = receiveEmpNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadingStatus() {
		return readingStatus;
	}
	public void setReadingStatus(String readingStatus) {
		this.readingStatus = readingStatus;
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
		return "MyNoticeDto [no=" + no + ", postNo=" + postNo + ", sendEmpNo=" + sendEmpNo + ", sendEmpName="
				+ sendEmpName + ", receiveEmpNo=" + receiveEmpNo + ", content=" + content + ", readingStatus="
				+ readingStatus + ", deleted=" + deleted + ", createdDate=" + createdDate + ", updatedDate="
				+ updatedDate + ", deletedDate=" + deletedDate + ", boardNo=" + boardNo + ", boardName=" + boardName
				+ "]";
	}
	
}
