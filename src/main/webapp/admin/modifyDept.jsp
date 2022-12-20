<%@page import="com.community.vo.Department"%>
<%@page import="com.community.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	// 폼입력값 조회
	int deptNo = Integer.parseInt(request.getParameter("deptNo"));
	String name = request.getParameter("name");
	
	// 부서번호로 부서이름을 조회
	DepartmentDao departmentDao = new DepartmentDao();
	Department department = departmentDao.getDepartmentByNo(deptNo);
	
	// 데이터베이스에 조회한 부서목록을 수정폼에서 제출한 값으로 변경
	department.setName(name);
	
	// DepartmentDao 객체의 updateDepartment(Department department) 메소드를 실행해서 변경된 직원정보를 반영시킴
	departmentDao.updateDepartment(department);
	
	response.sendRedirect("depts.jsp");

%>