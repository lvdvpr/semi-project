<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	int empNo = 1000;

	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	// 세션에서 작성자번호 불러오기
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	// 파일 불러오기
	
	FreeBoard freeBoard = new FreeBoard();
	freeBoard.setWriterNo(empNo);
	freeBoard.setBoardNo(boardNo);
	freeBoard.setTitle(title);
	freeBoard.setImportant(important);
	freeBoard.setContent(content);
	
	FreeDao freeDao = FreeDao.getInstance();
	
	freeDao.insertPost(freeBoard);
	
	response.sendRedirect("list.jsp");
	
%>