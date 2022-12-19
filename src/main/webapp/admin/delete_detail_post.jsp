<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// 상세 게시글 삭제
	int no = StringUtils.stringToInt(request.getParameter("no"));
	Employee loginEmployee = (Employee)session.getAttribute("LOGIN_EMPLOYEE");
	AdminPostDao postDao  = AdminPostDao.getInstance();
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	Post post =detailPost.getPost();
	int boardNo = post.getBoardNo(); // 재요청 url 전송 시 사용할 게시판 번호
	
	// 게시글의 삭제 상태를 'D'로 변경한다.
	post.setDeleted("D");
	postDao.updatePost(post);
	
	// 삭제 작업 완료 후 게시물 리스트로 이동한다.
	response.sendRedirect("posts.jsp?boardNo="+boardNo);
	
	
%>