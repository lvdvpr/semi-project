<%@page import="com.community.vo.Employee"%>
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
	// [관리자 상세 페이지 댓글 삭제]
	//게시물 번호, 댓글 번호를 조회한다.
	int no = StringUtils.stringToInt(request.getParameter("no"));
	int cno = StringUtils.stringToInt(request.getParameter("cno"));
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	if (employee== null) {
		response.sendRedirect("../employee/loginform.jsp?error=deny");
	}
	AdminCommentDao commentDao = AdminCommentDao.getInstance();
	AdminCommentDto detailComment = commentDao.getCommentByCno(cno);
	Comment comment = detailComment.getComment();


	comment.setDeleted("Y");
	commentDao.updateComment(comment);
		

	
	AdminPostDao postDao = AdminPostDao.getInstance();
	AdminPostDto detailPost= postDao.getDetailPostByNo(no);
	Post post = detailPost.getPost();
	
	// 댓글 수 1 감소
	post.setCommentCount(post.getCommentCount()-1);	
	postDao.updatePost(post);
	// 재요청URL 전송
	response.sendRedirect("detail.jsp?no="+no);
	
%>
