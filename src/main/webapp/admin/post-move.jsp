<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="java.util.Date"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	//[게시글 이동 작업]
	// no, boardNo 값 조회
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	int no = StringUtils.stringToInt(request.getParameter("no"));
	
	// Dao생성
	AdminPostDao postDao = AdminPostDao.getInstance();
	// 전달받은 게시글 번호로 게시글 정보를 조회하고 전달받은 게시판 번호로 변경한다. 
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	Post post = detailPost.getPost();
	
	//  게시판 번호 설정
	post.setBoardNo(boardNo);
	// 변경사항을 DB에 반영
	postDao.updatePost(post);
	
	
	// 재요청 url 전송
	response.sendRedirect("posts.jsp?boardNo="+boardNo);
	
%>