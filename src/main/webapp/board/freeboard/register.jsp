<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");

	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	
	FreeBoard freeBoard = new FreeBoard();
	freeBoard.setBoardNo(boardNo);
	freeBoard.setTitle(title);
	freeBoard.setImportant(important);
	freeBoard.setContent(content);
	freeBoard.setWriterNo(employee.getNo());
	
	FreeDao freeDao = FreeDao.getInstance();
	
	freeDao.insertPost(freeBoard);
	
	response.sendRedirect("list.jsp");
	
%>