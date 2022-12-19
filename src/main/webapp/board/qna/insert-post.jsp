<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int originalNo = StringUtils.stringToInt(request.getParameter("originalNo"));
	String important = request.getParameter("important");

	// writertNo 가져오는 session 객체
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	Question question = new Question();
	
	// 질문글 등록
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setContent(content);
	question.setImportant(important);
	question.setWriterNo(employee.getNo());
	
	QuestionDao questionDao = QuestionDao.getInstance();
	
	questionDao.insertPost(question);
	
	response.sendRedirect("list.jsp");
		
%>

