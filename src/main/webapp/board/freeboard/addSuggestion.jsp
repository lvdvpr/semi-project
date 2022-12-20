<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.AdminNoticeDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="com.community.dao.SuggestionDao"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");

	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	
	FreeDao freeDao = FreeDao.getInstance();
	FreeBoard freeBoard = freeDao.getPostByNo(postNo);
	
	SuggestionDao suggestionDao = new SuggestionDao();
	Suggestion suggestion = new Suggestion();
	suggestion.setEmpNo(employee.getNo());
	suggestion.setSuggestionPostNo(postNo);
	
	try {
		suggestionDao.insertSuggestion(suggestion);
	} catch (Exception e) {
		response.sendRedirect("detail.jsp?no="+ postNo +"&error=suggest");
		return;
	}
	
	freeBoard.setSuggestionCount(freeBoard.getSuggestionCount() + 1);
	freeDao.updatePost(freeBoard);
	
	
	/*
	// 알림 보내기 추가
	AdminNoticeDao noticeDao = AdminNoticeDao.getInstance();
	Notice notice = new Notice();
	notice.setPostNo(postNo);
	notice.setSendEmpNo(employee.getNo());
	notice.setReceiveEmpNo(freeBoard.getWriterNo());
	notice.setContent("[추천] " + postNo + "번 글을 추천하였습니다.");
	
	noticeDao.insertNotice(notice);               
	*/
	response.sendRedirect("detail.jsp?no=" + postNo);
	
	
%>