package com.community.vo;

import java.util.Date;

public class Notice {
	
	private int no;				// 알림번호
	private int postNo;			// 게시글 번호
	private int sendEmpNo;		// 송신자 직원번호
	private int receiveEmpNo;	// 수신자 직원번호
	private String content;	
	private String readingStatus;
	private String deleted;
	private Date createdDate;
	private Date updatedDate;
	private Date deletedDate;
	
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
		return "Notice [no=" + no + ", postNo=" + postNo + ", sendEmpNo=" + sendEmpNo + ", receiveEmpNo=" + receiveEmpNo
				+ ", content=" + content + ", readingStatus=" + readingStatus + ", deleted=" + deleted
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate=" + deletedDate
				+ "]";
	}
	
}
