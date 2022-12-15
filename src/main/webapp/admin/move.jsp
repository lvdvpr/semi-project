<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="java.util.Date"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// no, boardNo 값 조회
	int no = StringUtils.stringToInt(request.getParameter("no"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	
	// Dao생성
	AdminPostDao postDao = AdminPostDao.getInstance();
	// vo 조회
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	//  게시판 번호 설정
	Post post = detailPost.getPost();
	post.setBoardNo(boardNo);
	
	// 변경사항을 DB에 반영
	postDao.updatePost(post);
	
	// 재요청 url 전송
	response.sendRedirect("posts.jsp");
%>