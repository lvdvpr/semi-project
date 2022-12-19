<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.AdminNoticeDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// 관리자 게시글 조회
	// 요청 파라미터로 originalNo, boardNo, title, WriterNo, important, content 조회
	Employee employee = (Employee)session.getAttribute("LOGIN_EMPLOYEE");
	int writerNo = employee.getNo(); 
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	int originalNo = StringUtils.stringToInt(request.getParameter("originalNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String important = request.getParameter("important");
	
	
	Post answerPost = new Post();
	
	answerPost.setBoardNo(boardNo);
	answerPost.setTitle(title);
	answerPost.setContent(content);
	answerPost.setOriginalNo(originalNo); // 전달받은 게시글 번호를 원글 번호에 저장함 . (원글번호와 original번호가 일치하면 질문글 / 일치하지 않으면 답변글)
	answerPost.setImportant(important);
	answerPost.setWriterNo(writerNo);
	
	AdminPostDao postDao = AdminPostDao.getInstance();
	postDao.insertAnswer(answerPost); // 답글 등록
	

	
	response.sendRedirect("detail.jsp?no="+originalNo);
	
			
	
%>