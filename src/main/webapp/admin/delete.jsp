<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.dto.EmplyListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	// 요청파라미터에서 직원번호를 조회한다.
	int empNo = Integer.parseInt(request.getParameter("empNo"));
	
	// EmployeeDao 객체를 생성하고, 직원번호(정보)를 삭제하는 메소드를 실행시킴
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	Employee employee = employeeDao.getEmployeeByEmpNo(empNo);
	
	employee.setDeleted("N");
	employeeDao.updateEmployee(employee);
	
	response.sendRedirect("employees.jsp");
%>

