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
	
	// 로그인한 사원과 작성자가 다른 경우 삭제 불가능
	if (loginEmployee.getNo()!=post.getWriterNo()) {
		response.sendRedirect("detail.jsp?no="+no+"&error=delete");
		return;
	}
	
	post.setDeleted("D");
	postDao.updatePost(post);
	
	response.sendRedirect("posts.jsp");
	
	
%>