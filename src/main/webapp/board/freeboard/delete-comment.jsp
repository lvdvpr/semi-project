<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	int postNo = StringUtils.stringToInt(request.getParameter("no"));
	int commentNo = StringUtils.stringToInt(request.getParameter("cno"));
	
	CommentDao commentDao = new CommentDao();
	Comment comment = commentDao.getCommentByCno(commentNo);
	
	comment.setDeleted("Y");
	commentDao.updateComment(comment);
	
	FreeDao freeDao = FreeDao.getInstance();
	FreeBoard freeBoard = freeDao.getPostByNo(postNo);
	
	freeBoard.setCommentCount(freeBoard.getCommentCount() -1);
	
	freeDao.updatePost(freeBoard);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
%>