
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	// modifyform.jsp에 폼입력값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	int deptNo = Integer.parseInt(request.getParameter("deptNo"));
	int positionNo = Integer.parseInt(request.getParameter("positionNo"));
	
	// 직원번호로 직원정보를 조회
	EmployeeDao employeeDao = new EmployeeDao();
	Employee employee = employeeDao.getEmployeeByEmpNo(no);
	
	// 데이터베이스에 조회한 직원정보를 수정폼에서 제출한 값으로 변경
	employee.setName(name);
	employee.setEmail(email);
	employee.setPhone(phone);
	employee.setDeptNo(deptNo);
	employee.setPositionNo(positionNo);
	
	// EmployeeDao 객체의 updateEmployee(Employee employee) 메소드를 실행해서 변경된 직원정보를 반영시킴
	employeeDao.updateEmployee(employee);
	
	
	response.sendRedirect("employees.jsp");
%>