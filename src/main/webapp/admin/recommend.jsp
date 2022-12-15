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
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	
	// Dao생성
	AdminPostDao postDao = AdminPostDao.getInstance();
	// vo 조회
	AdminPostDto detailPost = postDao.getDetailPostByNo(postNo);
	// 추천 정보 저장
	AdminSuggestionDao suggestionDao = AdminSuggestionDao.getInstance();
	Suggestion suggestion = new Suggestion();
	suggestion.setSuggestionPostNo(postNo);
	suggestion.setEmpNo(1001); // 추후 세션에서 꺼내서 작업
	// 추천 2번 이상 방지 - 예외 처리
	try {
		suggestionDao.insertSuggestion(suggestion);
	} catch (Exception e) {
		response.sendRedirect("detail.jsp?postNo="+postNo+"&error=suggest");
		return;
	}
	
	// 게시물 정보 추천 수 1 증가
	Post post = detailPost.getPost();
	post.setSuggestionCount(post.getSuggestionCount() + 1);
	postDao.updatePost(post);
	// 알림 정보 추가
	AdminNoticeDao noticeDao = AdminNoticeDao.getInstance();
	Notice notice = new Notice();
	notice.setPostNo(postNo);
	notice.setSendEmpNo(1001); // 추후 세션에서 꺼내서 작업
	notice.setReceiveEmpNo(post.getWriterNo());
	notice.setContent("[추천] " + postNo + "번 글을 추천하였습니다.");
	
	noticeDao.insertNotice(notice);
	
	response.sendRedirect("detail.jsp?postNo="+postNo);
%>