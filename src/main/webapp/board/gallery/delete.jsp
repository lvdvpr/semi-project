<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	String[] postNoArry = request.getParameterValues("postNo");

	//세션에서 가져온 로그인된 사용자 번호
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	int deleteUserNo = employee.getNo();

	GalleryDao galleryDao = GalleryDao.getInstance();

	for (String postNoAr : postNoArry) {
		int no = Integer.parseInt(postNoAr);
		Gallery gallery = galleryDao.getPostByNo(no);
		
		gallery.setDeleted("D");
		galleryDao.deletedPost(gallery);
	}

	response.sendRedirect("list.jsp");
	
%>