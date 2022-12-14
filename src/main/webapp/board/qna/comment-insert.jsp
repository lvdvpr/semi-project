<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.commnuity.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<%
	// 게시글 번호, 내용, 직원번호
	int no = StringUtils.stringToInt(request.getParameter("postNo"));
	String commentContent = request.getParameter("content");
	int commentEmpNo = StringUtils.stringToInt(request.getParameter("empNo"));
	
	Comment comment = new Comment();
	
	comment.setCommentContent(commentContent);
	comment.setCommentEmpNo(commentEmpNo);
	comment.setCommentPostNo(no);
	
	// comment 등록
	CommentDao commentDao = new CommentDao();	
	commentDao.insertComment(comment);
	
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getNoPost(no);
	
	question.setCommentCount(question.getCommentCount() +1);
	questionDao.updatePost(question);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>