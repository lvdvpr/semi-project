<%@page import="com.community.vo.Gallery"%>
<%@page import="com.community.dao.GalleryDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	String content = request.getParameter("content");
	int no = StringUtils.stringToInt(request.getParameter("postNo"));
	
	if (content.isEmpty()) {
		response.sendRedirect("detail.jsp?no=" + no + "&error=invalid");
		return;
	}
	
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	Comment comment = new Comment();
	comment.setContent(content);
	comment.setPostNo(no);
	comment.setEmpNo(employee.getNo());
	
	CommentDao commentDao = new CommentDao();
	commentDao.insertComment(comment);
	
	// 게시물 댓글 +1 증가시키기
	GalleryDao galleryDao = GalleryDao.getInstance();
	Gallery gallery = galleryDao.getPostByNo(no);
	gallery.setCommentCount(gallery.getCommentCount() +1);
	
	galleryDao.updatedPost(gallery);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>