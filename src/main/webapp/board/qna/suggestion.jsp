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

	// postNo에 맞는 게시글 조회
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getNoPost(no);
	
		// 추천 정보에 추가되어야한다. 로그인한 글 번호랑 사용자번호 등록
		// 로그인한 사용자로 등록하고, 똑같은게 또 등록되면 오류날 거임
		// 1번 글을 1번 사용자가 또 추천하면 오류발생하게 만듦 (로그인된 사용에서 사용자 번호를 가지고 와야한다)
		// SUGGESTION 테이블 등록 
		// emp_no post_no
	
	// 추천수 구현
	Suggestion suggestion = new Suggestion();
	
	SuggestionDao suggestionDao = new SuggestionDao();
	suggestion.setSuggestionPostNo(no);
	// suggestion.setEmpNo(사용자 번호); // 로그인 구현 후, 사용자 번호 등록하고 주석 풀기
	
		/*
		if (로그인에서 가져오는 사용자 번호 setAttribute name (ex. longedUser) 넣기 != null) {
		
		}
		*/
	
	// comm_post_suggestion 테이블에 등록 - if문 안으로 들어가기
	suggestionDao.insertSuggestion(suggestion);

	// 추천 누르면 +1 되게 구현 - if문 안으로 들어가기
	Question qeustion = new Question();
	question.setSuggestionCount(question.getSuggestionCount() + 1);
	questionDao.updatePost(question);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>