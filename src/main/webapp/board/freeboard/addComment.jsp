<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.AdminNoticeDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.FreeBoard"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	Employee employee = (Employee) session.getAttribute("LOGIN_EMPLOYEE");
	
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	String content = request.getParameter("content");
	
	Comment comment = new Comment();

	comment.setPostNo(postNo);
	comment.setEmpNo(employee.getNo());
	comment.setContent(content);
	
	CommentDao commentDao = new CommentDao();
	commentDao.insertComment(comment);
	
	FreeDao freeDao = FreeDao.getInstance();
	FreeBoard freeBoard = freeDao.getPostByNo(postNo);
	
	freeBoard.setCommentCount(freeBoard.getCommentCount() + 1);
	freeDao.updatePost(freeBoard);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
	
	// 알림 보내기 추가
	AdminNoticeDao noticeDao = AdminNoticeDao.getInstance();
	Notice notice = new Notice();
	notice.setPostNo(postNo);
	notice.setSendEmpNo(employee.getNo());
	notice.setReceiveEmpNo(freeBoard.getWriterNo());
	notice.setContent("[추천] " + postNo + "번 글을 추천하였습니다.");
	
	noticeDao.insertNotice(notice);               
%>