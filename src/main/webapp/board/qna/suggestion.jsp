<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));

	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	// 하나의 postNo를 여러 empNo가 추천할 수 있기 때문에, postNo와 empNo를 동시에 조회해준다. 
	Map<String, Integer> param = new HashMap<>();
	param.put("postNo", postNo);
	param.put("empNo", employee.getNo());
	
	SuggestionDao suggestionDao = new SuggestionDao();
	Suggestion suggestions = suggestionDao.selectSuggestion(param);
	
	if (suggestions != null) {
		response.sendRedirect("detail.jsp?no=" + postNo + "&error=deny");
		return;
	}
	
	QuestionDao questionDao = QuestionDao.getInstance();

	// comm_post_suggestion 테이블에 등록
	Suggestion suggestion = new Suggestion();
	suggestion.setSuggestionPostNo(postNo);
	suggestion.setEmpNo(employee.getNo());
	suggestionDao.insertSuggestion(suggestion);

	// 추천수 구현
	// 추천수 증가를 위한 postNo에 맞는 게시글 조회
	Question question = questionDao.getNoPost(postNo);
	question.setSuggestionCount(question.getSuggestionCount() + 1);
	questionDao.updatePost(question);

	response.sendRedirect("detail.jsp?no=" + postNo);
	
	
	
%>