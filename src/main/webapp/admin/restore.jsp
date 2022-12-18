<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%


	//no를 여러 개 전달받아서 배열에 저장한다.
	String[] noarr = request.getParameterValues("no");
	AdminPostDao postDao = AdminPostDao.getInstance();
	
	// 반복문을 통해 전달받은 no값을 꺼내고, 삭제 상태를 N으로 변경한다. (복원)
	for (String noStr : noarr) {
		
		int no = Integer.parseInt(noStr.trim());
	
		AdminPostDto detailPost = postDao.getDetailPostByNo(no);
		Post post = detailPost.getPost();
		post.setDeleted("N");
		postDao.updatePost(post);
		
	}
	
	response.sendRedirect("posts.jsp");
	
	%>
%>