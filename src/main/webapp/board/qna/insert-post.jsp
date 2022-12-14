<%@page import="com.community.vo.Question"%>
<%@page import="com.commnuity.util.StringUtils"%>
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
	
	// TODO 로그인 세션에서 사용자 번호 획득하기, 사용자 이름(emp-name)도 session으로 가져온다.
	int writerNo = 1;
	
	Question question = new Question();
	

	// 질문글 등록
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setContent(content);
	question.setImportant(important);
	// 로그인 추가시 바꿔야함
	question.setWriterNo(writerNo);
	
	QuestionDao questionDao = new QuestionDao();
	
	questionDao.insertPost(question);
	
	response.sendRedirect("list.jsp");
	
%>

