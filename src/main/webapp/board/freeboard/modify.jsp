<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String important = request.getParameter("important");
	
	FreeDao freeDao = FreeDao.getInstance();
	FreeBoard freeBoard = freeDao.getPostByNo(postNo);
	
	freeBoard.setNo(postNo);
	freeBoard.setBoardNo(boardNo);
	freeBoard.setWriterNo(employee.getNo());
	freeBoard.setTitle(title);
	freeBoard.setImportant(important);
	freeBoard.setContent(content);
	freeBoard.setWriterNo(employee.getNo());
	
	freeDao.updatePost(freeBoard);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
%>