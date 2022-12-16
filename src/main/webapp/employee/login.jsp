<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	//  요청 파라미터로 직원번호와 비밀번호 값 조회
	int no = StringUtils.stringToInt(request.getParameter("no"));
	String password = request.getParameter("password");

	// EmployeeDao 객체 생성
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	// no로 Employee객체 조회
	Employee employee = employeeDao.getEmployeeByNo(no);
	// employee가 null이면 loginform.jsp?error="fail"로 응답
	if (employee == null) {
		response.sendRedirect("loginform.jsp?error=id");
		return;
	}
	
	// 비밀번호 불일치 - loginform.jsp?error="fail"로 응답
	if (!employee.getPassword().equals(password)) { 
		response.sendRedirect("loginform.jsp?error=password");
		return;
	}
	
	session.setAttribute("LOGIN_EMPLOYEE", employee);
	
	response.sendRedirect("../home.jsp");
%>