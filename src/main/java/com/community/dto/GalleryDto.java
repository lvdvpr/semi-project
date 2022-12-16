package com.community.dto;

import java.util.Date;

public class GalleryDto {

	// COMM_POSTS, COMM_EMPLOYEES, COMM_DEPARTMENTS, COMM_POSTS_FILE 테이블 dto.
	private int no;					// no
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
	private int originalNo;
	private int empNo;					// comm_employees 테이블	
	private String name;				// comm_employees 테이블 // name
	private int deptNo;					// comm_employees 테이블
	private int fileNo;					// comm_posts_file 테이블
	private String fileName;			// comm_posts_file 테이블
	private int filePostNo; 			// comm_posts_file 테이블
	private int departmentNo;			// comm_departments 테이블
	private String departmentName; 		// comm_departments 테이블
	private int positionNo;				// comm_position 테이블
	private String positionName;		// comm_position 테이블
	
	public GalleryDto() {}

	public void setNo(int no) {
		this.no = no;
	}
	
	public int getNo() {
		return no;
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

	public int getOriginalNo() {
		return originalNo;
	}

	public void setOriginalNo(int originalNo) {
		this.originalNo = originalNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFilePostNo() {
		return filePostNo;
	}

	public void setFilePostNo(int filePostNo) {
		this.filePostNo = filePostNo;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
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

	@Override
	public String toString() {
		return "GallaryDto [no=" + no + ", boardNo=" + boardNo + ", title=" + title + ", writerNo=" + writerNo
				+ ", content=" + content + ", important=" + important + ", readCount=" + readCount
				+ ", suggestionCount=" + suggestionCount + ", commentCount=" + commentCount + ", deleted=" + deleted
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate=" + deletedDate
				+ ", originalNo=" + originalNo + ", empNo=" + empNo + ", name=" + name + ", fileNo=" + fileNo
				+ ", fileName=" + fileName + ", filePostNo=" + filePostNo + ", deptNo=" + deptNo + ", departmentNo="
				+ departmentNo + ", departmentName=" + departmentName + ", positionNo=" + positionNo + ", positionName="
				+ positionName + "]";
	}

}
