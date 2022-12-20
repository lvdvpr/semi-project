<%@page import="com.community.dao.DepartmentDao"%>
<%@page import="com.community.vo.Department"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	// 요청객체에 저장된 요청파라미터값을 가져오기
	String name = request.getParameter("name");

	// Department 객체를 생성해서 전달받은 부서이름을 객체에 담기
	Department department = new Department();
	department.setName(name);
	
	// Department 객체를 생성하고, 부서이름을 테이블에 저장하는 메소드를 실행시킴 
	DepartmentDao departmentDao = new DepartmentDao();
	departmentDao.insertDepartment(department);
	
	response.sendRedirect("depts.jsp");
%>