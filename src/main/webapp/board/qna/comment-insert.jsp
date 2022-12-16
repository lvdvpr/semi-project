<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<%
	// 게시글 번호, 내용, 직원번호
	int no = StringUtils.stringToInt(request.getParameter("postNo"));
	String commentContent = request.getParameter("content");
	
	// empNo를 가지고 오는 session객체
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	Comment comment = new Comment();
	
	comment.setContent(commentContent);
	comment.setEmpNo(employee.getNo());
	comment.setPostNo(no);
	
	// comment 등록
	CommentDao commentDao = new CommentDao();	
	commentDao.insertComment(comment);
	
	// 게시물 추천수 +1 증가
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getNoPost(no);
	
	question.setCommentCount(question.getCommentCount() +1);
	questionDao.updatePost(question);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>