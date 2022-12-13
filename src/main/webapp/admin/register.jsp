<%@page import="com.community.dto.EmplyListDto"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	//요청객체에 저장된 요청파라미터값을 가져오기 (입력폼으로 전달한 요청파라미터값 조회)
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	int deptNo = Integer.parseInt(request.getParameter("deptNo"));
	int positionNo = Integer.parseInt(request.getParameter("positionNo"));
	String type = request.getParameter("type");
	
	// Employee 객체를 생성해서 전달받은 직원정보를 객체에 담기
	Employee employee = new Employee();
	employee.setName(name);
	employee.setEmail(email);
	employee.setPhone(phone);
	employee.setDeptNo(deptNo);
	employee.setPositionNo(positionNo);
	employee.setType(type);
	
	// EmployeeDao 객체를 생성하고, 직원정보를 테이블에 저장하는 메소드를 실행시킴
	EmployeeDao employeeDao = new EmployeeDao();
	employeeDao.insertEmployee(employee);
	
	response.sendRedirect("employees.jsp");

%>
