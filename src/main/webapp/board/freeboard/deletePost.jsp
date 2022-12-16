<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	String[] values = request.getParameterValues("postNo");
	
	if (values == null) {
		response.sendRedirect("list.jsp");
		return;
	}
	
	FreeDao freeDao = FreeDao.getInstance();
	for (String value : values) {
		int postNo = StringUtils.stringToInt(value);
		FreeBoard freeBoard = freeDao.getPostByNo(postNo);
		
		freeBoard.setDeleted("D");
		freeDao.updatePost(freeBoard);
	}
	
	response.sendRedirect("list.jsp");
%>