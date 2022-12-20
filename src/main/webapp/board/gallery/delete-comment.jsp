<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	int no = StringUtils.stringToInt(request.getParameter("no"));
	int commentNo = StringUtils.stringToInt(request.getParameter("cno"));
	
	CommentDao commentDao = new CommentDao();
    Comment comment = commentDao.getCommentByNo(commentNo);
    
    comment.setDeleted("Y");
    commentDao.updateComment(comment);
	
	GalleryDao galleryDao = GalleryDao.getInstance();
	Gallery gallery = galleryDao.getPostByNo(no);
	
	gallery.setCommentCount(gallery.getCommentCount() -1);
	galleryDao.updatedPost(gallery);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>