<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.AdminNoticeDao"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="com.community.dao.AdminSuggestionDao"%>
<%@page import="com.community.vo.Reading"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// no값 조회
	int no = StringUtils.stringToInt(request.getParameter("no"));
	// loginEmployee 조회
	Employee employee = (Employee)session.getAttribute("LOGIN_EMPLOYEE");

	// Dao생성
	AdminPostDao postDao = AdminPostDao.getInstance();
	// vo 조회
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	// 추천 정보 저장
	AdminSuggestionDao suggestionDao = AdminSuggestionDao.getInstance();
	Suggestion suggestion = new Suggestion();
	suggestion.setPostNo(no);
	suggestion.setEmpNo(employee.getNo());
	// 중복 추천 방지
	try {
		suggestionDao.insertSuggestion(suggestion);
	} catch (Exception e) {
		response.sendRedirect("detail.jsp?no="+no+"&error=suggest");
		return;
	}
	
	// 게시물 정보 추천 수 1 증가
	Post post = detailPost.getPost();
	post.setSuggestionCount(post.getSuggestionCount() + 1);
	postDao.updatePost(post);

	
	response.sendRedirect("detail.jsp?no="+no);
%>