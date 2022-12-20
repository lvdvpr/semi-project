<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// 게시글 번호(요청객체)에서 요청파라미터 정보를 조회한다.
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));

	int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	
	// postNo에 해당하는 게시글을 삭제한다.
	PostDao postDao = new PostDao();
	postDao.deletePostByPostNo(postNo);
	
	// 재요청 URL을 응답으로 보낸다.
	response.sendRedirect("mypost.jsp?rows="+rows+"&page="+currentPage+"&opt="+opt+"&keyword="+keyword);
%>