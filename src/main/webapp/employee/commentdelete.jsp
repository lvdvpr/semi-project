<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%

	int commentNo = StringUtils.stringToInt(request.getParameter("commentNo"));

	// commentNo에 해당하는 댓글을 삭제한다.
	// Fact = comm_post_comments의 comment_deleted 테이블의 값을 'Y'로 변경한다.
	CommentDao commentDao = new CommentDao();
	commentDao.deleteCommentByCommentNo(commentNo);
	
	// 재요청 URL을 응답으로 보낸다.
	response.sendRedirect("mycomment.jsp");
%>