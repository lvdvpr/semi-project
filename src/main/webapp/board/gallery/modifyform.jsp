<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// boardNo, title, empNo, improtant, content
	int no = StringUtils.stringToInt(request.getParameter("postNo"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String important = request.getParameter("important");
	
	// session 객체
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	GalleryDao galleryDao = GalleryDao.getInstance();
	Gallery gallery = galleryDao.getPostByNo(no);
	
	gallery.setNo(no);
	gallery.setBoardNo(boardNo);
	gallery.setTitle(title);
	gallery.setContent(content);
	gallery.setImportant(important);
	
	galleryDao.updatedPost(gallery);

	response.sendRedirect("detail.jsp?no=" + no);
%>
