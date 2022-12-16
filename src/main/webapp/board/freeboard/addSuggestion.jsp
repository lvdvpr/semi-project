<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	int empNo = StringUtils.stringToInt(request.getParameter("empNo"));
	
	FreeDao freeDao = FreeDao.getInstance();
	FreeBoard freeBoard = freeDao.getPostByNo(postNo);
	
	freeBoard.setSuggestionCount(freeBoard.getSuggestionCount() + 1);
	
	freeDao.updatePost(freeBoard);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
%>