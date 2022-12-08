package com.community.vo;

import java.util.Date;

public class Employee {

	private int no;					// 직원번호
	private String password;
	private String name;
	private String email;
	private String phone;
	private int deptNo;				// 소속부서번호
	private int positionNo;			// 직위번호
	private String type;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public int getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(int positionNo) {
		this.positionNo = positionNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
		return "Employee [no=" + no + ", password=" + password + ", name=" + name + ", email=" + email + ", phone="
				+ phone + ", deptNo=" + deptNo + ", positionNo=" + positionNo + ", type=" + type + ", deleted="
				+ deleted + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", deletedDate="
				+ deletedDate + "]";
	}
	
	
}
