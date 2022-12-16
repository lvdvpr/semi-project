package com.community.dto;

import java.util.Date;

import com.community.vo.Question;
import com.community.vo.Suggestion;

public class QnaDto {

	// COMM_POSTS 테이블과 COMM_EMPLOYEES과 COMM_DEPARTMENTS 테이블 dto.
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
	private int originalNo;
	private int empNo;					// comm_employees 테이블	
	private String name;				// comm_employees 테이블
	private int deptNo;					// comm_employees 테이블
	private int positionNo;				// comm_employees 테이블
	private int departmentNo;			// comm_departments 테이블
	private String departmentName; 		// comm_departments 테이블
	private String positionName;		// comm_departments 테이블
	
	public Question getQuestion() {
		Question question = new Question();
		question.setNo(no);
		question.setBoardNo(boardNo);
		question.setTitle(title);
		question.setWriterNo(writerNo);
		question.setContent(content);
		question.setImportant(important);
		question.setReadCount(readCount);
		question.setSuggestionCount(suggestionCount);
		question.setCommentCount(commentCount);
		question.setDeleted(deleted);
		question.setCreatedDate(createdDate);
		question.setUpdatedDate(updatedDate);
		question.setDeletedDate(deletedDate);
		question.setOriginalNo(originalNo);
		
		return question;
	}
	
	public Suggestion getSuggestion() {
		Suggestion  suggestion = new Suggestion();
		suggestion.setSuggestionPostNo(suggestionCount);
		suggestion.setEmpNo(no);
		
		return suggestion;
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

	public String getDepartmentName() {
		return departmentName;
	}
	
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	public int getDepartmentNo() {
		return departmentNo;
	}
	
	public void setDepartmentNo(int departmentNo) {
		this.departmentNo = departmentNo;
	}
	
	public QnaDto() {};
	
	public int getDeptNo() {
		return deptNo;
	}
	
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "QnaDto [no=" + no + ", boardNo=" + boardNo + ", title=" + title + ", writerNo=" + writerNo
				+ ", content=" + content + ", important=" + important + ", readCount=" + readCount
				+ ", suggestionCount=" + suggestionCount + ", commentCount=" + commentCount + ", deleted=" + deleted
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate=" + deletedDate
				+ ", originalNo=" + originalNo + ", empNo=" + empNo + ", name=" + name + ", deptNo=" + deptNo
				+ ", departmentNo=" + departmentNo + ", departmentName=" + departmentName + ", positionNo=" + positionNo
				+ ", positionName=" + positionName + "]";
	}
	
}

