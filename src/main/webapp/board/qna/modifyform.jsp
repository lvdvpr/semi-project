<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	int no = StringUtils.stringToInt(request.getParameter("postNo"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String important = request.getParameter("important");
	
	// 로그인 session.getAttribute로 가져오기
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getNoPost(no);
	
	question.setNo(no);
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setContent(content);
	question.setImportant(important);
	question.setWriterNo(employee.getNo());
	
	questionDao.updatePost(question);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>