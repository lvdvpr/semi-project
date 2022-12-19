<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<% 
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int originalNo = StringUtils.stringToInt(request.getParameter("originalNo"));
	String important = request.getParameter("important");
	
	
	// writerNo 가져오는 session객체
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	Question question = new Question();
	
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setContent(content);
	question.setOriginalNo(originalNo);
	question.setImportant(important);
	question.setWriterNo(employee.getNo());
	
	QuestionDao questionDao = QuestionDao.getInstance();
	
	questionDao.insertPostAnswer(question);
	
	response.sendRedirect("list.jsp");
	
%>