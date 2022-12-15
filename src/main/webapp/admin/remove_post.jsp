<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
/*
	게시글 삭제
	요청 파라미터로 no 값 조회하기
	- dao실행해서 해당 게시물정보를 조회한다.
	- 게시물 삭제 
	- setter메소드를 통해 deleted상태를 ‘D’으로 변경한다.
	- dao의 update 메소드를 실행해서 변경사항을 데이터베이스에 반영한다.
	- 재요청 url을 응답으로 보낸다. response.sendRedirect("posts.jsp")
	
*/

	int no = StringUtils.stringToInt(request.getParameter("no"));
	AdminPostDao postDao = AdminPostDao.getInstance();
	
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	Post post = detailPost.getPost();
	
	post.setDeleted("D");
	postDao.updatePost(post);
	
	response.sendRedirect("posts.jsp");
	
	%>