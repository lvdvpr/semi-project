<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%

	// 페이지와 게시판 번호를 요청 파라미터 값에서 꺼내기
	int currentPage = StringUtils.stringToInt(request.getParameter("page"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	//no를 여러 개 전달받아서 배열에 저장한다.
	String[] noarr = request.getParameterValues("no");
	AdminPostDao postDao = AdminPostDao.getInstance();
	
	// 전달받은 no값으로 게시물의 삭제 상태를 N으로 변경한다. (복원)
	for (String noStr : noarr) {
		
		int no = Integer.parseInt(noStr.trim());
	
		AdminPostDto detailPost = postDao.getDetailPostByNo(no);
		Post post = detailPost.getPost();
		post.setDeleted("N");
		postDao.updatePost(post);
		
	}
	
	response.sendRedirect("posts.jsp?page="+currentPage+"&boardNo="+boardNo);
	
	%>
%>