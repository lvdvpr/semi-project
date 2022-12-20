<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.AdminNoticeDao"%>
<%@page import="com.community.dao.AdminCommentDao"%>
<%@page import="com.community.dao.AdminPostDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dto.AdminPostDto"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%
	// [관리자 상세 게시글 댓글 추가]
	// 게시물 번호, content를 조회한다.
	Employee employee= (Employee)session.getAttribute("LOGIN_EMPLOYEE");
	int no = StringUtils.stringToInt(request.getParameter("no"));
	String content = request.getParameter("content");

	
	Comment comment = new Comment();
	comment.setPostNo(no);
	comment.setContent(content);
	comment.setEmpNo(employee.getNo());
	
	AdminCommentDao commentDao = AdminCommentDao.getInstance();
	commentDao.insertComment(comment);

	
	AdminPostDao postDao = AdminPostDao.getInstance(); 
	AdminPostDto detailPost = postDao.getDetailPostByNo(no);
	Post post = detailPost.getPost();
	// 댓글수 1 증가
	post.setCommentCount(post.getCommentCount() + 1);
	postDao.updatePost(post);
	
	//알림 정보 추가
	AdminNoticeDao noticeDao = AdminNoticeDao.getInstance();
	Notice notice = new Notice();
	notice.setPostNo(no);
	notice.setSendEmpNo(employee.getNo()); 
	notice.setReceiveEmpNo(post.getWriterNo());
	notice.setContent("[댓글] " + no + "번 게시글에 댓글이 등록되었습니다.");
	
	noticeDao.insertNotice(notice);
	
	response.sendRedirect("detail.jsp?no="+no);
%>
