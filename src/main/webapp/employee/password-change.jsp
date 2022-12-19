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
	String password2 = request.getParameter("password2");
	
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	
	Employee employee = employeeDao.getEmployeeByNo(loginEmployee.getNo());
	
	if(!employee.getPassword().equals(prevPassword)) {
		response.sendRedirect("passwordform.jsp?error=fail");
		return;
	}
	
	if(prevPassword.equals(password)) {
		response.sendRedirect("passwordform.jsp?error=fail2");
		return;
	}
	
	employee.setPassword(password);
	employeeDao.updateEmployee(employee);
	
	response.sendRedirect("password-change-completed.jsp");
%>