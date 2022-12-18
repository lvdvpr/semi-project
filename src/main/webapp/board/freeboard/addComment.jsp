<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	int no = StringUtils.stringToInt(request.getParameter("no"));
	int empNo = StringUtils.stringToInt(request.getParameter("empNo"));
	String content = request.getParameter("content");
	
	Comment comment = new Comment();
	// 댓글 작성자 넣기
	comment.setNo(no);
	comment.setEmpNo(empNo);
	comment.setContent(content);
	comment.setPostNo(postNo);
	
	CommentDao commentDao = new CommentDao();
	commentDao.insertComment(comment);
	
	FreeDao freeDao = FreeDao.getInstance();
	FreeBoard freeBoard = freeDao.getPostByNo(postNo);
	
	freeBoard.setCommentCount(freeBoard.getCommentCount() + 1);
	
	freeDao.updatePost(freeBoard);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
%>