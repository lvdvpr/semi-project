<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.commnuity.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<% 
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int originalNo = StringUtils.stringToInt(request.getParameter("originalNo"));
	String important = request.getParameter("important");
	
	// 로그인 추가 시 바꿔야함, emp_name도 추가해야함
	int writerNo = 1;
	
	Question question = new Question();
	
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setContent(content);
	question.setOriginalNo(originalNo);
	question.setImportant(important);
	// 로그인 추가 시 바꿔야함
	question.setWriterNo(writerNo);
	
	QuestionDao questionDao = new QuestionDao();
	
	questionDao.insertPostAnswer(question);
	
	response.sendRedirect("list.jsp");
	
%>