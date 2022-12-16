<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.SuggestionDao"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="com.community.dto.QnaDto"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	
	int no = StringUtils.stringToInt(request.getParameter("postNo"));

	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	// 추천수 구현
	Suggestion suggestion = new Suggestion();
	
	SuggestionDao suggestionDao = new SuggestionDao();
	suggestion.setSuggestionPostNo(no);
	suggestion.setEmpNo(employee.getNo());
	
		/*
		if (로그인에서 가져오는 사용자 번호 setAttribute name (ex. longedUser) 넣기 != null) {
		
		}
		*/

	// 추천수 증가를 위한 postNo에 맞는 게시글 조회
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getNoPost(no);
	
	// comm_post_suggestion 테이블에 등록
	suggestionDao.insertSuggestion(suggestion);

	Question qeustion = new Question();
	question.setSuggestionCount(question.getSuggestionCount() + 1);
	questionDao.updatePost(question);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>