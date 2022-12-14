<%@page import="com.community.dao.AdminCommentDao"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// 게시물 번호, content를 조회한다.
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	String content = request.getParameter("content");
	int empNo = 1001; // 추후 로그인한 정보로 변경하기
	
	Comment comment = new Comment();
	comment.setPostNo(postNo);
	comment.setContent(content);
	comment.setEmpNo(empNo);
	
	AdminCommentDao commentDao = AdminCommentDao.getInstance();
	
	try {
		commentDao.insertComment(comment);
	} catch (Exception e) {
		response.sendRedirect("detail.jsp?postNo="+postNo+"&error=nocomment");
		return;
	}
	
	AdminPostDao postDao = AdminPostDao.getInstance();
	AdminPostDto detailPost = postDao.getDetailPostByNo(postNo);
	Post post = detailPost.getPost();
	// 게시물 조회 1 증가
	post.setCommentCount(post.getCommentCount() + 1);
	postDao.updatePost(post);
	
	response.sendRedirect("detail.jsp?postNo="+postNo);
%>
