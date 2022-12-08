package com.community.dto;

import java.util.Date;

public class EmployeeDto {
	
	private int empNo;				// 직원번호
	private Date createdDate;		// 입사일
	private String deptName;		// 소속부서명
	private String positionName;	// 직위이름
	private String name;			// 직원이름
	private String phone;			// 연락처
	private String email;			// 이메일
	
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "EmployeeDto [empNo=" + empNo + ", createdDate=" + createdDate + ", deptName=" + deptName
				+ ", positionName=" + positionName + ", name=" + name + ", phone=" + phone + ", email=" + email + "]";
	}
	
}
