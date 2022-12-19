<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>


<%
	Employee loginEmployee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	if (loginEmployee == null) {
		response.sendRedirect("loginform.jsp?error=deny");
		return;
	}
	
	String prevPassword = request.getParameter("prevPassword");
	String password = request.getParameter("password");
	
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	
	Employee employee = employeeDao.getEmployeeByNo(loginEmployee.getNo());
	
	if(!employee.getPassword().equals(prevPassword)) {
		response.sendRedirect("passwordform.jsp?error=fail");
		return;
	}
	
	employee.setPassword(password);
	employeeDao.updateEmployee(employee);
	
	response.sendRedirect("password-change-completed.jsp");
%>