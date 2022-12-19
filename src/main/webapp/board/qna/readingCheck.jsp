<%@page import="com.community.vo.Reading"%>
<%@page import="com.community.dao.ReadingsDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// 삭제 예정
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	int no = StringUtils.stringToInt(request.getParameter("no"));
	
	ReadingsDao readingsDao = ReadingsDao.getInstance();
	Reading reading = readingsDao.selectReading(employee.getNo());
	
	if (reading != null) {
		response.sendRedirect("detail.jsp?no" + no);
		return;
	}
%>