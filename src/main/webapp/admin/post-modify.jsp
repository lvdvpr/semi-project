<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
// [관리자] 게시글 상세 수정

	Employee loginEmployee = (Employee)session.getAttribute("LOGIN_EMPLOYEE");
	
	int no = StringUtils.stringToInt(request.getParameter("no"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	
	
	// 게시글 조회하기
	AdminPostDao postDao = AdminPostDao.getInstance();
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	Post post =detailPost.getPost();
	

	// 업데이트 실행
	post.setBoardNo(boardNo);
	post.setTitle(title);
	post.setImportant(important);
	post.setContent(content);
	
	postDao.updatePost(post);
	
	// 재요청 URL 전송
	response.sendRedirect("detail.jsp?&no="+no);
%>