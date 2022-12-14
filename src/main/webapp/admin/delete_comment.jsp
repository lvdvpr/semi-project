<%@page import="com.community.dao.AdminCommentDao"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.dto.AdminCommentDto"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	//게시물 번호, 댓글 번호를 조회한다.
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	int cno = StringUtils.stringToInt(request.getParameter("cno"));
	//Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	// 본인이 작성한 댓글이 아니면 return
	
	AdminCommentDao commentDao = AdminCommentDao.getInstance();
	AdminCommentDto detailComment = commentDao.getCommentByCno(cno);
	Comment comment = detailComment.getComment();
	
	comment.setDeleted("Y");
	commentDao.updateComment(comment);
	
	AdminPostDao postDao = AdminPostDao.getInstance();
	AdminPostDto detailPost = postDao.getDetailPostByNo(postNo);
	Post post = detailPost.getPost();
	post.setCommentCount(post.getCommentCount()-1);	
	postDao.updatePost(post);
	
	response.sendRedirect("detail.jsp?postNo="+postNo);
	
%>
