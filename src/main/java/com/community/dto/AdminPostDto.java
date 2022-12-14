package com.community.dto;

import java.util.Date;

import com.community.vo.Post;

public class AdminPostDto {

	private int no;
	private int boardNo;
	private String title;
	private int empNo;
	private String name;	      
	private String important;
	private String postContent;
	private int readCount; 
	private int suggestionCount;   
	private int commentCount;
	private String departmentName;	
	private String positionName;
	private String postDeleted;
	private Date createdDate;     
	private Integer originalNo;
	
	

	public AdminPostDto () {
		
	}
	
	public Post getPost() {
		Post post = new Post();
		post.setNo(no);
		post.setBoardNo(boardNo);
		post.setWriterNo(empNo);
		post.setTitle(title);
		post.setContent(postContent);
		post.setReadCount(readCount);
		post.setSuggestionCount(suggestionCount);
		post.setCommentCount(commentCount);
		post.setDeleted(postDeleted);
		post.setImportant(important);
		post.setOriginalNo(originalNo);
		
		return post;
	} 
	
	public String getPostDeleted() {
		return postDeleted;
	}
	public void setPostDeleted(String postDeleted) {
		this.postDeleted = postDeleted;
	}

	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	public String getImportant() {
		return important;
	}
	
	public void setImportant(String important) {
		this.important = important;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSuggestionCount() {
		return suggestionCount;
	}
	public void setSuggestionCount(int suggestionCount) {
		this.suggestionCount = suggestionCount;
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
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public Integer getOriginalNo() {
		return originalNo;
	}

	public void setOriginalNo(Integer originalNo) {
		this.originalNo = originalNo;
	}

	@Override
	public String toString() {
		return "AdminPostDto [no=" + no + ", boardNo=" + boardNo + ", title=" + title + ", name=" + name
				+ ", important=" + important + ", postContent=" + postContent + ", readCount=" + readCount
				+ ", suggestionCount=" + suggestionCount + ", commentCount=" + commentCount + ", departmentName="
				+ departmentName + ", positionName=" + positionName + ", postDeleted=" + postDeleted + ", createdDate="
				+ createdDate + ", originalNo=" + originalNo + "]";
	}

	

	



}
