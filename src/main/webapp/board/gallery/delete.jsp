<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	String[] postNoArry = request.getParameterValues("postNo");

	for (String postNoAr : postNoArry) {
		int no = Integer.parseInt(postNoAr);
		GalleryDao galleryDao = GalleryDao.getInstance();
		Gallery gallery = galleryDao.getPostByNo(no);
		
		gallery.setDeleted("D");
		gallery.setNo(no);
		galleryDao.deletedPost(gallery);
	}

	response.sendRedirect("list.jsp");
	
%>