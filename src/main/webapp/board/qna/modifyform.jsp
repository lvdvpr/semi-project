<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.commnuity.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	int no = StringUtils.stringToInt(request.getParameter("postNo"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// 로그인 session.setAttribute로 가져오기
	int wirterNo = 1;
	String important = request.getParameter("important");
	
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getNoPost(no);
	
	question.setNo(no);
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setContent(content);
	question.setImportant(important);
	
	questionDao.updatePost(question);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>